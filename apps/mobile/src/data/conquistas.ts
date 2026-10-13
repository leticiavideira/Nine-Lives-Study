export type Conquista = { id: string; nome: string; meta: number; descricao: string };

// meta em minutos de foco acumulados
export const CONQUISTAS: Conquista[] = [
  { id: '1', nome: 'Primeiros passos', meta: 30, descricao: 'Estude por 30 minutos no total.' },
  { id: '2', nome: 'Focado', meta: 60, descricao: 'Acumule 1 hora de foco.' },
  { id: '3', nome: 'Dedicado', meta: 180, descricao: 'Acumule 3 horas de foco.' },
  { id: '4', nome: 'Maratonista', meta: 600, descricao: 'Acumule 10 horas de foco.' },
  { id: '5', nome: 'Mestre dos estudos', meta: 3000, descricao: 'Acumule 50 horas de foco.' },
];
