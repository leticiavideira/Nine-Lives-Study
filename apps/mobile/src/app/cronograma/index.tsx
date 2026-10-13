import { Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { useState } from 'react';
import { Pressable, ScrollView, Text, View } from 'react-native';

import { Card, screen } from '@/components/ui';
import { DIAS, type Dia } from '@/data/materias';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Cronograma() {
  const router = useRouter();
  const atividades = useAppStore((s) => s.atividades);
  const [dia, setDia] = useState<Dia>(DIAS[0]);
  const lista = atividades.filter((a) => a.dia === dia);
  return (
    <View style={[screen.root, { backgroundColor: colors.morningBlue }]}>
      <ScrollView contentContainerStyle={screen.content}>
        <Pressable onPress={() => router.push('/cronograma/add')}><Ionicons name="add-circle" size={52} color={colors.liverChestnut} /></Pressable>
        <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 8, justifyContent: 'center' }}>
          {DIAS.map((d) => (
            <Pressable key={d} onPress={() => setDia(d)} style={{ paddingVertical: 10, paddingHorizontal: 14, borderRadius: 12, backgroundColor: d === dia ? colors.liverChestnut : colors.cafeAuLait }}>
              <Text style={{ color: colors.white }}>{d}</Text>
            </Pressable>
          ))}
        </View>
        {lista.length === 0 && <Text style={{ color: colors.white }}>Nenhuma atividade para {dia}.</Text>}
        {lista.map((a) => (
          <Card key={a.id}><Text style={{ color: colors.white, fontWeight: '700' }}>{a.horario}</Text><Text style={{ color: colors.white }}>{a.nome}</Text></Card>
        ))}
      </ScrollView>
    </View>
  );
}
