//
//  StreakManager.swift
//  DayStreak
//
//  Created by Turma02 on 07/10/25.
//

import Foundation
import Combine

class StreakManager: ObservableObject {
    @Published var streak: Int = 0
    private let userDefaultsKey: String
    private var lastDate: Date?

    init(key: String) {
        self.userDefaultsKey = key
        checkStreakValidity()
    }

    /// Verifica se o streak foi quebrado ao iniciar o app
    func checkStreakValidity() {
        let today = Calendar.current.startOfDay(for: Date())

        if let saved = loadStreakData() {
            let last = Calendar.current.startOfDay(for: saved.lastDate)
            let diff = Calendar.current.dateComponents([.day], from: last, to: today).day ?? 0

            if diff > 1 {
                // Perdeu o streak
                streak = 0
                saveStreakData(StreakData(streak: 0, lastDate: last))
            } else {
                // Mantém o streak atual
                streak = saved.streak
            }

            lastDate = last
        } else {
            streak = 0
        }
    }

    /// Chamada quando o usuário executa a ação (ex: estuda)
    func updateStreakIfNeeded() {
        let today = Calendar.current.startOfDay(for: Date())

        if let last = lastDate {
            let diff = Calendar.current.dateComponents([.day], from: last, to: today).day ?? 0

            if diff == 1 {
                streak += 1
            } else if diff == 0 {
                // já contou hoje, não faz nada
                return
            } else {
                streak = 1 // reinicia
            }
        } else {
            streak = 1
        }

        lastDate = today
        saveStreakData(StreakData(streak: streak, lastDate: today))
    }

    private func saveStreakData(_ data: StreakData) {
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadStreakData() -> StreakData? {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode(StreakData.self, from: savedData) {
            return decoded
        }
        return nil
    }
}
