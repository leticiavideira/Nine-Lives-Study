export const COINS_PER_MINUTE = 10;

export const coinsForSeconds = (seconds: number) => (seconds * COINS_PER_MINUTE) / 60;

export const isUnlocked = (tempoEstudadoSeg: number, metaMin: number) =>
  tempoEstudadoSeg / 60 >= metaMin;

export function formatTime(totalSeconds: number) {
  const s = Math.max(0, Math.ceil(totalSeconds));
  const h = Math.floor(s / 3600);
  const m = Math.floor((s % 3600) / 60);
  const sec = s % 60;
  const mm = String(m).padStart(2, '0');
  const ss = String(sec).padStart(2, '0');
  return h > 0 ? `${h}h ${mm}m ${ss}s` : `${mm}m ${ss}s`;
}
