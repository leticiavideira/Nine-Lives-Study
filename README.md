# Nine Lives Study

App de estudos (timer, cronograma, pets, conquistas e tutor de IA).

- `apps/mobile` — app Expo (SDK 57, Expo Router) para iOS e Android.
- `apps/ios-swift` — versão original em SwiftUI (referência).

## Rodar

```bash
npm install
cp apps/mobile/.env.example apps/mobile/.env   # preencha EXPO_PUBLIC_GEMINI_API_KEY
cd apps/mobile && npx expo start
```

> A chave `EXPO_PUBLIC_*` fica embutida no bundle do app; use apenas para desenvolvimento/estudo.
