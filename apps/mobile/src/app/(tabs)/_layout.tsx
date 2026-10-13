import { Ionicons } from '@expo/vector-icons';
import { Tabs } from 'expo-router';

import { colors } from '@/theme/colors';

function TabIcon({ name, color, size }: { name: keyof typeof Ionicons.glyphMap; color: import('react-native').ColorValue; size: number }) {
  return <Ionicons name={name} size={size} color={color} />;
}

const icon = (name: keyof typeof Ionicons.glyphMap) =>
  // eslint-disable-next-line react/display-name
  ({ color, size }: { color: import('react-native').ColorValue; size: number }) => <TabIcon name={name} color={color} size={size} />;

export default function TabsLayout() {
  return (
    <Tabs screenOptions={{ tabBarActiveTintColor: colors.liverChestnut, tabBarStyle: { backgroundColor: colors.paleSilver }, headerShown: false }}>
      <Tabs.Screen name="index" options={{ title: 'Menu', tabBarIcon: icon('menu') }} />
      <Tabs.Screen name="pets" options={{ title: 'Pets', tabBarIcon: icon('paw') }} />
      <Tabs.Screen name="perfil" options={{ title: 'Perfil', tabBarIcon: icon('person') }} />
    </Tabs>
  );
}
