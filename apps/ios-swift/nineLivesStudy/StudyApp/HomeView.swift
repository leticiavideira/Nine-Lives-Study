
import SwiftUI


struct HomeView: View {
    @State var Nome: String = ""
    @State var tempoEstudado: Double = 7200
    @State var dinheiro: Double = 0
    @ObservedObject var manager = StreakManager(key: "DayStreak")

    
    var body: some View {
            TabView{
                
                menuView(tempoEstudado: $tempoEstudado, dinheiro: $dinheiro, manager: manager, Nome: $Nome)
                    .tabItem{
                        Label("Menu", systemImage: "line.3.horizontal")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.paleSilver, for: .tabBar)
                
                PetsView(dinheiro: $dinheiro)
                    .tabItem{
                        Label("Pets", systemImage: "pawprint")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.hidden, for: .tabBar)
                
                perfilView(tempoEstudado: $tempoEstudado, manager: manager, Nome: $Nome)
                    .tabItem{
                        Label("Perfil", systemImage: "person")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.hidden, for: .tabBar)
                
               
            }
            .tint(.liverChestnut)
        }
    }


#Preview {
    HomeView()
}
