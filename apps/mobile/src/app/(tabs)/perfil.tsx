import { Ionicons } from '@expo/vector-icons';
import { useRouter } from 'expo-router';
import { Pressable, ScrollView, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Card, StreakCard, screen } from '@/components/ui';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Perfil() {
  const router = useRouter();
  const { nome, tempoEstudado, materias, streak } = useAppStore();
  return (
    <SafeAreaView style={screen.root}>
      <ScrollView contentContainerStyle={screen.content}>
        <Pressable style={{ alignSelf: 'flex-end' }} onPress={() => router.push('/config')}><Ionicons name="settings" size={28} color={colors.liverChestnut} /></Pressable>
        <Ionicons name="person-circle" size={100} color={colors.liverChestnut} />
        <Text style={screen.title}>{nome || 'Sem nome'}</Text>
        <View style={{ flexDirection: 'row', flexWrap: 'wrap', gap: 16, justifyContent: 'center', width: '100%' }}>
          <View style={{ flex: 1, minWidth: 150, gap: 12 }}>
            <Pressable onPress={() => router.push('/conquistas')} style={{ flexDirection: 'row', gap: 8, alignItems: 'center', justifyContent: 'center', backgroundColor: colors.liverChestnut, borderRadius: 12, padding: 14 }}>
              <Ionicons name="medal" size={22} color={colors.white} /><Text style={{ color: colors.white, fontSize: 16 }}>Conquistas</Text>
            </Pressable>
            <Pressable onPress={() => router.push('/materias')}>
              <Card>
                <Text style={{ color: colors.white, fontWeight: '700', marginBottom: 6 }}>Matérias</Text>
                {materias.slice(0, 5).map((m) => <Text key={m} style={{ color: colors.white }}>• {m}</Text>)}
                {materias.length > 5 && <Text style={{ color: colors.white }}>+{materias.length - 5}…</Text>}
              </Card>
            </Pressable>
          </View>
          <View style={{ gap: 12, alignItems: 'center' }}>
            <StreakCard streak={streak.streak} />
            <Card style={{ width: 125, alignItems: 'center' }}>
              <Text style={{ color: colors.white, fontSize: 28, fontWeight: '800' }}>{Math.floor(tempoEstudado / 60)}</Text>
              <Text style={{ color: colors.white }}>min de foco</Text>
            </Card>
          </View>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
}
