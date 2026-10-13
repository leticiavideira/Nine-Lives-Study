import { useRouter } from 'expo-router';
import { useState } from 'react';
import { Pressable, ScrollView, Text, TextInput } from 'react-native';

import { screen } from '@/components/ui';
import { DIAS, type Dia } from '@/data/materias';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function AddAtividade() {
  const router = useRouter();
  const addAtividade = useAppStore((s) => s.addAtividade);
  const [nome, setNome] = useState('');
  const [horario, setHorario] = useState('');
  const [dia, setDia] = useState<Dia>(DIAS[0]);
  const salvar = () => {
    if (!nome.trim()) return;
    addAtividade({ nome: nome.trim(), horario: horario.trim(), dia });
    router.back();
  };
  return (
    <ScrollView style={screen.root} contentContainerStyle={screen.content} keyboardShouldPersistTaps="handled">
      <TextInput style={screen.input} placeholder="Atividade" value={nome} onChangeText={setNome} />
      <TextInput style={screen.input} placeholder="Horário (ex.: 14:00)" value={horario} onChangeText={setHorario} />
      <ScrollView horizontal style={{ flexGrow: 0 }} showsHorizontalScrollIndicator={false}>
        {DIAS.map((d) => (
          <Pressable key={d} onPress={() => setDia(d)} style={{ marginRight: 8, paddingVertical: 8, paddingHorizontal: 14, borderRadius: 20, backgroundColor: d === dia ? colors.liverChestnut : colors.cafeAuLait }}>
            <Text style={{ color: colors.white }}>{d}</Text>
          </Pressable>
        ))}
      </ScrollView>
      <Pressable onPress={salvar} style={{ backgroundColor: colors.liverChestnut, borderRadius: 12, paddingVertical: 12, paddingHorizontal: 28 }}>
        <Text style={{ color: colors.white, fontSize: 18 }}>Adicionar</Text>
      </Pressable>
    </ScrollView>
  );
}
