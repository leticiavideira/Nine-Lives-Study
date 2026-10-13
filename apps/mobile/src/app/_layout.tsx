import { Stack } from 'expo-router';
import { StatusBar } from 'expo-status-bar';
import { useEffect } from 'react';

import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function RootLayout() {
  useEffect(() => {
    const unsub = useAppStore.persist.onFinishHydration(() => useAppStore.getState().refreshStreak());
    if (useAppStore.persist.hasHydrated()) useAppStore.getState().refreshStreak();
    return unsub;
  }, []);

  return (
    <>
      <StatusBar style="dark" />
      <Stack screenOptions={{ headerStyle: { backgroundColor: colors.paleSilver }, headerTintColor: colors.liverChestnut, contentStyle: { backgroundColor: colors.paleSilver } }}>
        <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
        <Stack.Screen name="timer" options={{ title: 'Timer' }} />
        <Stack.Screen name="cronograma/index" options={{ title: 'Cronograma' }} />
        <Stack.Screen name="cronograma/add" options={{ title: 'Nova atividade', presentation: 'modal' }} />
        <Stack.Screen name="duvidas" options={{ title: 'Dúvidas' }} />
        <Stack.Screen name="conquistas/index" options={{ title: 'Conquistas' }} />
        <Stack.Screen name="conquistas/[id]" options={{ title: 'Conquista' }} />
        <Stack.Screen name="materias" options={{ title: 'Matérias' }} />
        <Stack.Screen name="loja" options={{ title: 'Loja', presentation: 'modal' }} />
        <Stack.Screen name="config" options={{ title: 'Configurações', presentation: 'modal' }} />
      </Stack>
    </>
  );
}
