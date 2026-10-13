export const MATERIAS_PADRAO = [
  'Matemática', 'Português', 'História', 'Geografia', 'Biologia', 'Física', 'Química',
  'Inglês', 'Artes', 'Filosofia', 'Sociologia', 'Literatura', 'Redação', 'Espanhol',
];

export const DIAS = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'] as const;
export type Dia = (typeof DIAS)[number];
