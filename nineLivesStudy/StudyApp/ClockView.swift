import SwiftUI

struct ClockView: View {
    @ObservedObject var manager : StreakManager
    @Binding var tempoEstudado: Double
    @Binding var dinheiro: Double
    @State private var inputMinutes: Double = 0
    @State private var totalTime: Double = 60
    @State private var timeRemaining: Double = 60
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var materia: String = "Materia"
    let materias = [
        "Matemática",
        "Português",
        "História",
        "Geografia",
        "Biologia",
        "Física",
        "Química",
        "Inglês",
        "Artes",
        "Filosofia",
        "Sociologia",
        "Literatura",
        "Redação",
        "Espanhol"
    ]
    
    var body: some View {
        VStack{
        VStack(spacing: 20) {
            ZStack {
                SemiCircularTimerSlider(
                    value: $timeRemaining,
                    range: 0...totalTime,
                    lineWidth: 10,
                    radius: 100
                )
                
                Text(formatTime(seconds: timeRemaining))
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
            }
            .frame(width: 200, height: 200)
            
            VStack {
                }
                TextField("Minutos", value: $inputMinutes, formatter: NumberFormatter())
                    .disabled(isRunning)
                    .padding(10)
                    .frame(width: 100)
                    .background(.cafeAuLait)
                    .cornerRadius(10)
                    .onChange(of: inputMinutes) {oldValue, newMinutes in
                        totalTime = newMinutes * 60
                        timeRemaining = totalTime
                    }
            }
            
            if !isRunning {
                Button("Iniciar") {
                    startTimer()
                    
                    manager.updateStreakIfNeeded()
                }
                .font(.headline)
                .padding()
                .background(Color.cafeAuLait)
                .foregroundColor(Color.liverChestnut)
                .cornerRadius(20)
            }
            
            
            
            VStack {
                Picker("", selection: $materia) {
                    ForEach(materias, id: \.self) { materia in
                        Text(materia)
                    }
                }.pickerStyle(.menu)
                    .tint(.black)
                
                ScrollView{
                    MetasView()
                }
                
            }.frame(width: 350, height: 200).background(.cafeAuLait).cornerRadius(20)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.paleSilver)
    }
    
    func startTimer() {
        timeRemaining = totalTime
        isRunning = true
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            } else {
                isRunning = false
                timer?.invalidate()
                
                dinheiro += (totalTime * 10)/60
                tempoEstudado += totalTime
                
            }
        }
    }
    
    func formatTime(seconds: Double) -> String {
        let totalSeconds = Int(seconds)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let secs = totalSeconds % 60
        
        if hours > 0 {
            return String(format: "%dh %02dm %02ds", hours, minutes, secs)
        } else {
            return String(format: "%02dm %02ds", minutes, secs)
        }
    }
}




//#Preview {
//    ClockView(manager: StreakManager(key: "DayStreak"), dinheiro: dinheiro)
//}

