export type StreakData = { streak: number; lastDate: string | null };

const DAY = 24 * 60 * 60 * 1000;

const startOfDay = (d: Date) => new Date(d.getFullYear(), d.getMonth(), d.getDate()).getTime();

const dayDiff = (from: string, now: Date) =>
  Math.round((startOfDay(now) - startOfDay(new Date(from))) / DAY);

/** Zera o streak se passou mais de 1 dia desde o último estudo. */
export function resetIfExpired(data: StreakData, now = new Date()): StreakData {
  if (data.lastDate && dayDiff(data.lastDate, now) > 1) return { ...data, streak: 0 };
  return data;
}

/** Chamado ao iniciar o timer. */
export function updateStreak(data: StreakData, now = new Date()): StreakData {
  if (!data.lastDate) return { streak: 1, lastDate: now.toISOString() };
  const diff = dayDiff(data.lastDate, now);
  if (diff === 0) return data;
  if (diff === 1) return { streak: data.streak + 1, lastDate: now.toISOString() };
  return { streak: 1, lastDate: now.toISOString() };
}
