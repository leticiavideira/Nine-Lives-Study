import SwiftUI

class CountdownTimerManager: ObservableObject {
    @Published var secondsRemaining: Double
    @Published var mode: TimerMode = .stopped

    private var timer: Timer?
    private var initialTime: Double

    enum TimerMode {
        case running, paused, stopped
    }

    init(initialTime: Double = 60.0) {
        self.initialTime = initialTime
        self.secondsRemaining = initialTime
    }

    func setInitialTime(_ time: Double) {
        stop()
        self.initialTime = time
        self.secondsRemaining = time
    }

    func start() {
        guard secondsRemaining > 0 else { return }
        mode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 0.1
            } else {
                self.stop()
            }
        }
    }

    func pause() {
        mode = .paused
        timer?.invalidate()
        timer = nil
    }

    func stop() {
        mode = .stopped
        timer?.invalidate()
        timer = nil
        secondsRemaining = initialTime
    }
}
