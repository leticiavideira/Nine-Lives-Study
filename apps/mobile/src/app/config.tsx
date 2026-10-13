import { useRouter } from 'expo-router';
import { useState } from 'react';
import { Pressable, Text, TextInput, View } from 'react-native';

import { screen } from '@/components/ui';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Config() {
  const router = useRouter();
  const { nome, setNome } = useAppStore();
  const [valor, setValor] = useState(nome);
  return (
    <View style={[screen.root, screen.content]}>
      <Text style={screen.title}>Seu nome</Text>
      <TextInput style={screen.input} value={valor} onChangeText={setValor} placeholder="Nome" autoFocus />
      <Pressable onPress={() => { setNome(valor.trim()); router.back(); }} style={{ backgroundColor: colors.liverChestnut, borderRadius: 12, paddingVertical: 12, paddingHorizontal: 28 }}>
        <Text style={{ color: colors.white, fontSize: 18 }}>Salvar</Text>
      </Pressable>
    </View>
  );
}
