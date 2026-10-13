import { useEffect, useRef, useState } from 'react';
import { Pressable, ScrollView, Text, TextInput, View } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';

import { Card, screen } from '@/components/ui';
import { TimerRing } from '@/components/TimerRing';
import { formatTime } from '@/lib/rewards';
import { useAppStore } from '@/store/useAppStore';
import { colors } from '@/theme/colors';

type Estado = 'parado' | 'rodando' | 'pausado';

function Btn({ label, onPress }: { label: string; onPress: () => void }) {
  return (
    <Pressable onPress={onPress} style={{ backgroundColor: colors.liverChestnut, borderRadius: 12, paddingVertical: 12, paddingHorizontal: 22 }}>
      <Text style={{ color: colors.white, fontSize: 18 }}>{label}</Text>
    </Pressable>
  );
}

export default function Timer() {
  const { materias, metas, addMeta, iniciarSessao, completarSessao } = useAppStore();
  const [minutos, setMinutos] = useState('25');
  const [materia, setMateria] = useState(materias[0]);
  const [estado, setEstado] = useState<Estado>('parado');
  const [total, setTotal] = useState(0);
  const [restante, setRestante] = useState(0);
  const [novaMeta, setNovaMeta] = useState('');
  const fim = useRef(0);

  useEffect(() => {
    if (estado !== 'rodando') return;
    const id = setInterval(() => {
      const r = (fim.current - Date.now()) / 1000;
      if (r <= 0) {
        setRestante(0);
        setEstado('parado');
        completarSessao(total);
      } else setRestante(r);
    }, 100);
    return () => clearInterval(id);
  }, [estado, total, completarSessao]);

  const iniciar = () => {
    const seg = Math.round(parseFloat(minutos.replace(',', '.')) * 60);
    if (!seg || seg <= 0) return;
    setTotal(seg);
    setRestante(seg);
    fim.current = Date.now() + seg * 1000;
    iniciarSessao();
    setEstado('rodando');
  };
  const pausar = () => { setRestante((fim.current - Date.now()) / 1000); setEstado('pausado'); };
  const retomar = () => { fim.current = Date.now() + restante * 1000; setEstado('rodando'); };
  const parar = () => { setEstado('parado'); setRestante(0); };

  return (
    <SafeAreaView style={screen.root} edges={['bottom']}>
      <ScrollView contentContainerStyle={screen.content} keyboardShouldPersistTaps="handled">
        <View style={{ alignItems: 'center', justifyContent: 'center' }}>
          <TimerRing progress={total ? 1 - restante / total : 0} />
          <Text style={{ position: 'absolute', fontSize: 30, fontWeight: '700', color: colors.liverChestnut }}>{formatTime(estado === 'parado' ? 0 : restante)}</Text>
        </View>
        {estado === 'parado' && (
          <>
            <TextInput style={screen.input} keyboardType="decimal-pad" value={minutos} onChangeText={setMinutos} placeholder="Minutos" />
            <ScrollView horizontal showsHorizontalScrollIndicator={false} style={{ flexGrow: 0 }}>
              {materias.map((m) => (
                <Pressable key={m} onPress={() => setMateria(m)} style={{ marginRight: 8, paddingVertical: 8, paddingHorizontal: 14, borderRadius: 20, backgroundColor: m === materia ? colors.liverChestnut : colors.cafeAuLait }}>
                  <Text style={{ color: colors.white }}>{m}</Text>
                </Pressable>
              ))}
            </ScrollView>
            <Btn label="Iniciar" onPress={iniciar} />
          </>
        )}
        {estado === 'rodando' && <View style={{ flexDirection: 'row', gap: 12 }}><Btn label="Pausar" onPress={pausar} /><Btn label="Parar" onPress={parar} /></View>}
        {estado === 'pausado' && <View style={{ flexDirection: 'row', gap: 12 }}><Btn label="Retomar" onPress={retomar} /><Btn label="Parar" onPress={parar} /></View>}
        {estado !== 'parado' && <Text style={{ color: colors.liverChestnut }}>Matéria: {materia}</Text>}
        <Card>
          <Text style={{ color: colors.white, fontWeight: '700', fontSize: 18, marginBottom: 8 }}>Metas</Text>
          {metas.map((m, i) => <Text key={i} style={{ color: colors.white }}>• {m}</Text>)}
          <TextInput style={[screen.input, { marginTop: 8 }]} value={novaMeta} onChangeText={setNovaMeta} placeholder="Nova meta"
            onSubmitEditing={() => { if (novaMeta.trim()) { addMeta(novaMeta.trim()); setNovaMeta(''); } }} />
        </Card>
      </ScrollView>
    </SafeAreaView>
  );
}
