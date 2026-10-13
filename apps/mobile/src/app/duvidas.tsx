import { Ionicons } from '@expo/vector-icons';
import { useRef, useState } from 'react';
import { ActivityIndicator, FlatList, KeyboardAvoidingView, Platform, Pressable, Text, TextInput, View } from 'react-native';

import { createChat } from '@/lib/gemini';
import { colors } from '@/theme/colors';

type Msg = { id: string; texto: string; eu: boolean };
type Chat = ReturnType<typeof createChat>;

export default function Duvidas() {
  const [msgs, setMsgs] = useState<Msg[]>([{ id: '0', eu: false, texto: 'Olá! Sou seu tutor de IA. Em que matéria posso te ajudar hoje?' }]);
  const [texto, setTexto] = useState('');
  const [carregando, setCarregando] = useState(false);
  const chat = useRef<Chat | null>(null);
  const lista = useRef<FlatList<Msg>>(null);

  const push = (m: Omit<Msg, 'id'>) => setMsgs((p) => [...p, { ...m, id: String(Date.now() + Math.random()) }]);

  const enviar = async () => {
    const t = texto.trim();
    if (!t || carregando) return;
    push({ eu: true, texto: t });
    setTexto('');
    setCarregando(true);
    try {
      chat.current ??= createChat();
      const r = await chat.current.sendMessage(t);
      push({ eu: false, texto: r.response.text() || 'Desculpe, não consegui processar a dúvida. Tente novamente.' });
    } catch (e) {
      push({ eu: false, texto: `Ocorreu um erro: ${e instanceof Error ? e.message : String(e)}` });
    } finally {
      setCarregando(false);
    }
  };

  return (
    <KeyboardAvoidingView style={{ flex: 1, backgroundColor: colors.paleSilver }} behavior={Platform.OS === 'ios' ? 'padding' : undefined} keyboardVerticalOffset={90}>
      <FlatList ref={lista} data={msgs} keyExtractor={(m) => m.id} contentContainerStyle={{ padding: 16, gap: 10 }}
        onContentSizeChange={() => lista.current?.scrollToEnd({ animated: true })}
        renderItem={({ item }) => (
          <View style={{ alignSelf: item.eu ? 'flex-end' : 'flex-start', maxWidth: '75%', padding: 12, borderRadius: 14, backgroundColor: item.eu ? colors.morningBlue : colors.cafeAuLait }}>
            <Text style={{ color: colors.white }}>{item.texto}</Text>
          </View>
        )}
        ListFooterComponent={carregando ? <ActivityIndicator color={colors.liverChestnut} style={{ alignSelf: 'flex-start', margin: 8 }} /> : null} />
      <View style={{ flexDirection: 'row', gap: 8, padding: 12, alignItems: 'center' }}>
        <TextInput style={{ flex: 1, backgroundColor: colors.white, borderRadius: 20, paddingHorizontal: 16, paddingVertical: 10 }} value={texto} onChangeText={setTexto} placeholder="Digite sua dúvida" onSubmitEditing={enviar} />
        <Pressable onPress={enviar}><Ionicons name="send" size={26} color={colors.liverChestnut} /></Pressable>
      </View>
    </KeyboardAvoidingView>
  );
}
