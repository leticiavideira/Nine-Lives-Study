import { Ionicons } from '@expo/vector-icons';
import { Pressable, StyleSheet, Text, View, type ViewStyle } from 'react-native';

import { colors } from '@/theme/colors';

export function BigButton({ label, onPress, icon }: { label: string; onPress: () => void; icon?: keyof typeof Ionicons.glyphMap }) {
  return (
    <Pressable style={styles.big} onPress={onPress}>
      {icon && <Ionicons name={icon} size={24} color={colors.white} />}
      <Text style={styles.bigText}>{label}</Text>
    </Pressable>
  );
}

export function StreakCard({ streak }: { streak: number }) {
  const active = streak > 0;
  return (
    <View style={[styles.streak, { backgroundColor: active ? colors.deepDumpling : colors.gray }]}>
      <Text style={[styles.streakNum, streak >= 100 && { fontSize: 40 }]}>{streak}</Text>
      <Text style={styles.streakLabel}>{streak === 1 ? 'dia' : 'dias'}</Text>
      <Ionicons name="flame" size={24} color={colors.white} />
    </View>
  );
}

export function Card({ children, style }: { children: React.ReactNode; style?: ViewStyle }) {
  return <View style={[styles.card, style]}>{children}</View>;
}

export const screen = StyleSheet.create({
  root: { flex: 1, backgroundColor: colors.paleSilver },
  content: { padding: 20, alignItems: 'center', gap: 16 },
  title: { fontSize: 22, fontWeight: '700', color: colors.liverChestnut },
  input: { backgroundColor: colors.white, borderRadius: 10, padding: 12, fontSize: 16, width: '100%' },
});

const styles = StyleSheet.create({
  big: { flexDirection: 'row', gap: 10, alignItems: 'center', justifyContent: 'center', backgroundColor: colors.liverChestnut, borderRadius: 14, height: 70, width: '100%', maxWidth: 320 },
  bigText: { color: colors.white, fontSize: 20, fontWeight: '600' },
  streak: { width: 125, height: 125, borderRadius: 18, alignItems: 'center', justifyContent: 'center' },
  streakNum: { color: colors.white, fontSize: 56, fontWeight: '800' },
  streakLabel: { color: colors.white, fontSize: 14 },
  card: { backgroundColor: colors.cafeAuLait, borderRadius: 16, padding: 16, width: '100%' },
});
