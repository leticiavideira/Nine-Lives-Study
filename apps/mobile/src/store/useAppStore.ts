import AsyncStorage from '@react-native-async-storage/async-storage';
import { create } from 'zustand';
import { createJSONStorage, persist } from 'zustand/middleware';

import { MATERIAS_PADRAO, type Dia } from '@/data/materias';
import { PETS } from '@/data/pets';
import { coinsForSeconds } from '@/lib/rewards';
import { resetIfExpired, updateStreak, type StreakData } from '@/lib/streak';

export type Atividade = { id: string; dia: Dia; horario: string; nome: string };

type State = {
  nome: string;
  tempoEstudado: number; // segundos
  dinheiro: number;
  petsComprados: string[];
  atividades: Atividade[];
  materias: string[];
  metas: string[];
  streak: StreakData;
  setNome: (n: string) => void;
  completarSessao: (segundos: number) => void;
  iniciarSessao: () => void;
  refreshStreak: () => void;
  comprarPet: (id: string) => boolean;
  addAtividade: (a: Omit<Atividade, 'id'>) => void;
  addMateria: (m: string) => void;
  removeMateria: (m: string) => void;
  addMeta: (m: string) => void;
};

export const useAppStore = create<State>()(
  persist(
    (set, get) => ({
      nome: '',
      tempoEstudado: 7200,
      dinheiro: 0,
      petsComprados: [],
      atividades: [],
      materias: MATERIAS_PADRAO,
      metas: [],
      streak: { streak: 0, lastDate: null },
      setNome: (nome) => set({ nome }),
      iniciarSessao: () => set((s) => ({ streak: updateStreak(s.streak) })),
      refreshStreak: () => set((s) => ({ streak: resetIfExpired(s.streak) })),
      completarSessao: (segundos) =>
        set((s) => ({
          dinheiro: s.dinheiro + coinsForSeconds(segundos),
          tempoEstudado: s.tempoEstudado + segundos,
        })),
      comprarPet: (id) => {
        const pet = PETS.find((p) => p.id === id);
        const { dinheiro, petsComprados } = get();
        if (!pet || petsComprados.includes(id) || dinheiro < pet.custo) return false;
        set({ dinheiro: dinheiro - pet.custo, petsComprados: [...petsComprados, id] });
        return true;
      },
      addAtividade: (a) =>
        set((s) => ({ atividades: [...s.atividades, { ...a, id: String(Date.now()) }] })),
      addMateria: (m) =>
        set((s) => (s.materias.includes(m) ? s : { materias: [...s.materias, m] })),
      removeMateria: (m) => set((s) => ({ materias: s.materias.filter((x) => x !== m) })),
      addMeta: (m) => set((s) => ({ metas: [...s.metas, m] })),
    }),
    { name: 'nine-lives-store', storage: createJSONStorage(() => AsyncStorage) },
  ),
);
