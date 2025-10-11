import SwiftUI

struct ConquistasView: View {
    @StateObject private var viewModel = ConquistaViewModel()
    @Binding var tempoEstudado: Double
    
    var body: some View {
        NavigationStack{
            
            
            ZStack{
                Color.paleSilver
                    .ignoresSafeArea()
                
                
                VStack{
                    Text("Conquistas")
                        .font(.title)
                    
                    
                    ScrollView{
                        ForEach(viewModel.conquistas, id: \.self){i in
                            VStack{
                                ZStack{
                                    if tempoEstudado/60 < i.meta{
                                        Circle()
                                            .foregroundColor(Color.gray)
                                            .frame(width: 110,height: 110)
                                    } else {
                                        Circle()
                                            .foregroundColor(Color.blue)
                                            .frame(width: 110,height: 110)
                                        
                                    }
                                    NavigationLink(destination: ConquistaDetailView(Descricao: i.descricao, Nome: i.nome) ){
                                        
                                       
                                        Image(systemName: "clock")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 90,height: 90)
                                            .frame(alignment: .center)
                                       
                                    }
                                   
                                   
                                    
                                    
                                    
                                    
                                }
                                
                                Text("\(i.nome)")
                                
                                
                            }
                        }.onAppear {
                            viewModel.fetchConquistas()
                        }
                    }
                }
                
            }
            
        }
    }
}
//#Preview {
//ConquistasView()
//}
