import { Ionicons } from '@expo/vector-icons';
import { useState } from 'react';
import { FlatList, Pressable, Text, TextInput, View } from 'react-native';

import { screen } from '@/components/ui';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

export default function Materias() {
  const { materias, addMateria, removeMateria } = useAppStore();
  const [nova, setNova] = useState('');
  const add = () => { if (nova.trim()) { addMateria(nova.trim()); setNova(''); } };
  return (
    <View style={screen.root}>
      <View style={{ flexDirection: 'row', gap: 8, padding: 16 }}>
        <TextInput style={[screen.input, { flex: 1, width: undefined }]} value={nova} onChangeText={setNova} placeholder="Nova matéria" onSubmitEditing={add} />
        <Pressable onPress={add}><Ionicons name="add-circle" size={44} color={colors.liverChestnut} /></Pressable>
      </View>
      <FlatList data={materias} keyExtractor={(m) => m} contentContainerStyle={{ paddingHorizontal: 16, gap: 8 }}
        renderItem={({ item }) => (
          <View style={{ flexDirection: 'row', justifyContent: 'space-between', alignItems: 'center', backgroundColor: colors.cafeAuLait, borderRadius: 12, padding: 14 }}>
            <Text style={{ color: colors.white, fontSize: 16 }}>{item}</Text>
            <Pressable onPress={() => removeMateria(item)}><Ionicons name="trash" size={22} color={colors.white} /></Pressable>
          </View>
        )} />
    </View>
  );
}
