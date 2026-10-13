import { coinsForSeconds, formatTime, isUnlocked } from '../rewards';
import { resetIfExpired, updateStreak } from '../streak';

const d = (s: string) => new Date(s);

describe('streak', () => {
  it('começa em 1', () => expect(updateStreak({ streak: 0, lastDate: null }, d('2026-03-10T10:00:00')).streak).toBe(1));
  it('mesmo dia mantém', () =>
    expect(updateStreak({ streak: 3, lastDate: d('2026-03-10T08:00:00').toISOString() }, d('2026-03-10T20:00:00')).streak).toBe(3));
  it('dia seguinte soma', () =>
    expect(updateStreak({ streak: 3, lastDate: d('2026-03-10T23:00:00').toISOString() }, d('2026-03-11T01:00:00')).streak).toBe(4));
  it('gap maior reinicia em 1', () =>
    expect(updateStreak({ streak: 3, lastDate: d('2026-03-10T08:00:00').toISOString() }, d('2026-03-13T08:00:00')).streak).toBe(1));
  it('reset zera após gap > 1', () =>
    expect(resetIfExpired({ streak: 5, lastDate: d('2026-03-10T08:00:00').toISOString() }, d('2026-03-13T08:00:00')).streak).toBe(0));
});

describe('rewards', () => {
  it('10 moedas por minuto', () => expect(coinsForSeconds(600)).toBe(100));
  it('conquista', () => { expect(isUnlocked(3600, 60)).toBe(true); expect(isUnlocked(3599, 60)).toBe(false); });
  it('formata tempo', () => { expect(formatTime(65)).toBe('01m 05s'); expect(formatTime(3725)).toBe('1h 02m 05s'); });
});
