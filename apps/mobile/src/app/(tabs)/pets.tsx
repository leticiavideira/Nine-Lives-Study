import { useRouter } from 'expo-router';
import { FlatList, Image, Pressable, Text, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { screen } from '@/components/ui';
import { PETS } from '@/data/pets';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Pets() {
  const router = useRouter();
  const comprados = useAppStore((s) => s.petsComprados);
  const meus = PETS.filter((p) => comprados.includes(p.id));
  return (
    <SafeAreaView style={screen.root}>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', padding: 20 }}>
        <Text style={screen.title}>Meus pets</Text>
        <Pressable onPress={() => router.push('/loja')}><Text style={[screen.title, { fontSize: 18 }]}>Loja 🛒</Text></Pressable>
      </View>
      {meus.length === 0 ? (
        <Text style={{ textAlign: 'center', color: colors.liverChestnut, padding: 20 }}>Você ainda não comprou nenhum pet. Visite a loja!</Text>
      ) : (
        <FlatList data={meus} numColumns={2} keyExtractor={(p) => p.id} contentContainerStyle={{ padding: 10 }}
          renderItem={({ item }) => <Image source={item.imagem} style={{ flex: 1, aspectRatio: 1, margin: 8 }} resizeMode="contain" />} />
      )}
    </SafeAreaView>
  );
}
