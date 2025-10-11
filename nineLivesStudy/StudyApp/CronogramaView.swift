import SwiftUI

struct Atividade: Hashable, Codable {
    var id = UUID()
    var nome: String
    var horario: String
    var ativ: String
}

struct cronogramaView: View {
    
    
    
    @State var arrayAtividades: [Atividade] = []
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.morningBlue
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        
                        Text ("Cronograma")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.paleSilver)
                        
                        Spacer()
                        Spacer()
                        
                        NavigationLink(destination: addView(arrayAtividades: $arrayAtividades)){
                            HStack{
                                Text("+")
                                    .font(.title2)
                                    .bold()
                            }
                        }
                        .padding()
                        .frame(width: 70,height: 70)
                        .background(.paleSilver)
                        .cornerRadius(65)
                        .foregroundColor(.morningBlue)
                        
                        
                        Spacer()
                        Spacer()
                        
                        
                        ForEach(dias.headerCases, id: \.self) { i in
                            
                            VStack{
                                NavigationLink(destination: ListaAtividadesView(dia: i, arrayAtividades: $arrayAtividades)){
                                    Text(i.name)
                                        .font(.title2)
                                        .bold()
                                }
                                .padding()
                                .frame(width: 270,height: 70)
                                .background(.paleSilver)
                                .cornerRadius(25)
                                .foregroundColor(.morningBlue)
                                
                                
                            }
                            
                        }
                    }
                    
                }
                .padding()
            }
        }
        .tint(.liverChestnut)
    }
}

#Preview {
    cronogramaView()
}
