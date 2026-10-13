<div align="center">

<img src="apps/mobile/assets/images/logo.png" alt="Nine Lives Study" width="120" />

# Nine Lives Study

**Estude com foco, mantenha sua sequência e ganhe gatinhos.**

App de estudos gamificado para iOS e Android, feito com Expo.

<img src="apps/mobile/assets/images/borboleta.png" alt="Winx" width="90" />
<img src="apps/mobile/assets/images/farao.png" alt="Ramsés" width="90" />
<img src="apps/mobile/assets/images/crocs.png" alt="Croc" width="90" />
<img src="apps/mobile/assets/images/palhaco.png" alt="Bozo" width="90" />
<img src="apps/mobile/assets/images/bruxo.png" alt="Harry" width="90" />
<img src="apps/mobile/assets/images/astronauta.png" alt="Houston" width="90" />

</div>

## O que é

O Nine Lives Study transforma tempo de estudo em recompensa. Cada minuto de foco rende moedas, que você troca por gatinhos na loja, e estudar todo dia mantém sua sequência (streak) acesa.

### Funcionalidades

- **Timer de foco**: anel de progresso, escolha da matéria, pausar e parar. Rende 10 moedas por minuto concluído.
- **Streak diário**: conta os dias seguidos de estudo.
- **Cronograma semanal**: atividades e horários por dia da semana.
- **Pets e loja**: 6 gatinhos para colecionar.
- **Conquistas**: desbloqueadas conforme o total de minutos de foco.
- **Matérias e metas**: lista de matérias personalizável e metas na tela do timer.
- **Dúvidas com IA**: chat com um tutor baseado no Google Gemini.
- Os dados ficam salvos no aparelho.

### Os gatinhos

| | Nome | Custo |
|---|---|---|
| <img src="apps/mobile/assets/images/borboleta.png" width="64" /> | Winx | 20 |
| <img src="apps/mobile/assets/images/palhaco.png" width="64" /> | Bozo | 30 |
| <img src="apps/mobile/assets/images/crocs.png" width="64" /> | Croc | 40 |
| <img src="apps/mobile/assets/images/farao.png" width="64" /> | Ramsés | 50 |
| <img src="apps/mobile/assets/images/astronauta.png" width="64" /> | Houston | 50 |
| <img src="apps/mobile/assets/images/bruxo.png" width="64" /> | Harry | 60 |

## Estrutura

```
apps/
  mobile/       App Expo (SDK 57, Expo Router, TypeScript)
  ios-swift/    Versão original em SwiftUI (referência)
```

## Como rodar

Requisitos: Node 20+ e o app **Expo Go** no celular (iOS ou Android).

```bash
# 1. instalar dependências (na raiz)
npm install

# 2. configurar a chave do Gemini (opcional, só para o chat de Dúvidas)
cp apps/mobile/.env.example apps/mobile/.env
# edite o arquivo e preencha EXPO_PUBLIC_GEMINI_API_KEY

# 3. iniciar
cd apps/mobile
npx expo start
```

Escaneie o QR code com a câmera (iPhone) ou com o Expo Go (Android). O celular precisa estar na mesma rede Wi-Fi do computador. Se não conectar, use `npx expo start --tunnel`.

A chave do Gemini pode ser obtida em [Google AI Studio](https://aistudio.google.com/apikey).

> Variáveis `EXPO_PUBLIC_*` ficam embutidas no app. Use a chave apenas em desenvolvimento.

### Outros comandos

```bash
npm test             # testes unitários (streak, moedas, conquistas)
npx tsc --noEmit     # checagem de tipos
npx expo lint        # lint
npx expo start --android   # emulador Android
npx expo start --ios       # simulador iOS (macOS)
```

## Tecnologias

Expo SDK 57 · React Native · Expo Router · Zustand · AsyncStorage · react-native-svg · Google Generative AI
