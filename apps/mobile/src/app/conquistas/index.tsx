import { Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { FlatList, Pressable, Text } from 'react-native';

import { screen } from '@/components/ui';
import { CONQUISTAS } from '@/data/conquistas';
import { isUnlocked } from '@/lib/rewards';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Conquistas() {
  const router = useRouter();
  const tempo = useAppStore((s) => s.tempoEstudado);
  return (
    <FlatList style={screen.root} data={CONQUISTAS} keyExtractor={(c) => c.id} numColumns={2}
      contentContainerStyle={{ padding: 16 }} columnWrapperStyle={{ gap: 16 }}
      renderItem={({ item }) => (
        <Pressable onPress={() => router.push(`/conquistas/${item.id}`)} style={{ flex: 1, alignItems: 'center', marginBottom: 20 }}>
          <Ionicons name="time" size={64} color={isUnlocked(tempo, item.meta) ? colors.morningBlue : colors.gray} />
          <Text style={{ color: colors.liverChestnut, textAlign: 'center' }}>{item.nome}</Text>
        </Pressable>
      )} />
  );
}
