import { useRouter } from 'expo-router';
import { FlatList, Image, Pressable, Text, View } from 'react-native';

import { screen } from '@/components/ui';
import { PETS } from '@/data/pets';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Loja() {
  const router = useRouter();
  const { dinheiro, petsComprados, comprarPet } = useAppStore();
  const disponiveis = PETS.filter((p) => !petsComprados.includes(p.id));
  return (
    <View style={screen.root}>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', padding: 20 }}>
        <Text style={screen.title}>$ {dinheiro.toFixed(0)}</Text>
        <Pressable onPress={() => router.back()}><Text style={[screen.title, { fontSize: 18 }]}>Fechar</Text></Pressable>
      </View>
      <FlatList data={disponiveis} keyExtractor={(p) => p.id} contentContainerStyle={{ padding: 16, gap: 12 }}
        ListEmptyComponent={<Text style={{ textAlign: 'center' }}>Você comprou todos os pets!</Text>}
        renderItem={({ item }) => {
          const pode = dinheiro >= item.custo;
          return (
            <View style={{ flexDirection: 'row', alignItems: 'center', gap: 12, backgroundColor: colors.cafeAuLait, borderRadius: 14, padding: 12 }}>
              <Image source={item.imagem} style={{ width: 70, height: 70 }} resizeMode="contain" />
              <View style={{ flex: 1 }}>
                <Text style={{ color: colors.white, fontWeight: '700', fontSize: 18 }}>{item.nome}</Text>
                <Text style={{ color: colors.white }}>$ {item.custo}</Text>
              </View>
              <Pressable disabled={!pode} onPress={() => comprarPet(item.id)}
                style={{ backgroundColor: pode ? colors.liverChestnut : colors.gray, borderRadius: 10, paddingVertical: 10, paddingHorizontal: 14 }}>
                <Text style={{ color: colors.white }}>{pode ? 'Comprar' : `Falta $ ${(item.custo - dinheiro).toFixed(0)}`}</Text>
              </Pressable>
            </View>
          );
        }} />
    </View>
  );
}
