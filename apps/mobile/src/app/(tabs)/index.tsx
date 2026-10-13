import { useRouter } from 'expo-router';
import { Image, ScrollView, Text } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { BigButton, StreakCard, screen } from '@/components/ui';
import { useAppStore } from '@/store/useAppStore';

export default function Menu() {
  const router = useRouter();
  const nome = useAppStore((s) => s.nome);
  const streak = useAppStore((s) => s.streak.streak);
  return (
    <SafeAreaView style={screen.root}>
      <ScrollView contentContainerStyle={screen.content}>
        <Image source={require('../../../assets/images/logo.png')} style={{ width: 90, height: 90 }} resizeMode="contain" />
        <Text style={screen.title}>Nine Lives Study</Text>
        <Text style={screen.title}>Olá, {nome}</Text>
        <Image source={require('../../../assets/images/cat.png')} style={{ width: 160, height: 160 }} resizeMode="contain" />
        <StreakCard streak={streak} />
        <BigButton label="Timer" icon="time-outline" onPress={() => router.push('/timer')} />
        <BigButton label="Cronograma" icon="calendar-outline" onPress={() => router.push('/cronograma')} />
        <BigButton label="Dúvidas" icon="chatbubbles-outline" onPress={() => router.push('/duvidas')} />
      </ScrollView>
    </SafeAreaView>
  );
}
