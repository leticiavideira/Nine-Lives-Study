import { GoogleGenerativeAI } from '@google/generative-ai';

const SYSTEM = 'Você é um tutor de IA amigável para estudantes. Explique em português do Brasil, de forma clara e didática, com exemplos curtos.';

export function createChat() {
  const key = process.env.EXPO_PUBLIC_GEMINI_API_KEY;
  if (!key) throw new Error('Defina EXPO_PUBLIC_GEMINI_API_KEY no .env');
  const model = new GoogleGenerativeAI(key).getGenerativeModel({ model: 'gemini-2.0-flash', systemInstruction: SYSTEM });
  return model.startChat();
}
