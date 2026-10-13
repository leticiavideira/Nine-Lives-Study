import type { ImageSourcePropType } from 'react-native';

export type PetDef = { id: string; nome: string; custo: number; imagem: ImageSourcePropType };

export const PETS: PetDef[] = [
  { id: 'farao', nome: 'Ramsés', custo: 50, imagem: require('../../assets/images/farao.png') },
  { id: 'crocs', nome: 'Croc', custo: 40, imagem: require('../../assets/images/crocs.png') },
  { id: 'palhaco', nome: 'Bozo', custo: 30, imagem: require('../../assets/images/palhaco.png') },
  { id: 'borboleta', nome: 'Winx', custo: 20, imagem: require('../../assets/images/borboleta.png') },
  { id: 'bruxo', nome: 'Harry', custo: 60, imagem: require('../../assets/images/bruxo.png') },
  { id: 'astronauta', nome: 'Houston', custo: 50, imagem: require('../../assets/images/astronauta.png') },
];
