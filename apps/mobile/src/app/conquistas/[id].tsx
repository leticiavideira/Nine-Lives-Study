import { Ionicons } from '@expo/vector-icons';
import { useLocalSearchParams } from 'expo-router';
import { Text, View } from 'react-native';

import { screen } from '@/components/ui';
import { CONQUISTAS } from '@/data/conquistas';
import { isUnlocked } from '@/lib/rewards';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function ConquistaDetalhe() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const tempo = useAppStore((s) => s.tempoEstudado);
  const c = CONQUISTAS.find((x) => x.id === id);
  if (!c) return null;
  const ok = isUnlocked(tempo, c.meta);
  return (
    <View style={[screen.root, screen.content]}>
      <Ionicons name="time" size={120} color={ok ? colors.morningBlue : colors.gray} />
      <Text style={screen.title}>{c.nome}</Text>
      <Text style={{ color: colors.liverChestnut, textAlign: 'center' }}>{c.descricao}</Text>
      <Text style={{ color: colors.liverChestnut }}>{ok ? 'Desbloqueada!' : `Faltam ${Math.ceil(c.meta - tempo / 60)} min`}</Text>
    </View>
  );
}
