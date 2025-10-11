import SwiftUI

struct SemiCircularTimerSlider: View {
    @Binding var value: Double   // valor atual do timer
    var range: ClosedRange<Double> = 0...60
    var lineWidth: CGFloat = 20
    var radius: CGFloat = 100

    var body: some View {
        ZStack {
            // Arco de fundo
            Circle()
                .trim(from: 0, to: 1.0)
                .rotation(Angle(degrees: -90))
                .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))

            // Arco de progresso
            Circle()
                .trim(from: 0, to: progressFraction())
                .rotation(Angle(degrees: -90))
                .stroke(Color.deepDumpling, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
        }
        .frame(width: radius * 2, height: radius * 2)
    }

    func progressFraction() -> Double {
        let fraction = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return fraction
    }
}
