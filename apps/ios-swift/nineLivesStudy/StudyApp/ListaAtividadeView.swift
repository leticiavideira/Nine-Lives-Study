import Foundation
import SwiftUI

struct ListaAtividadesView: View{
    
    @State var dia: dias
    @Binding var arrayAtividades: [Atividade]
    
    var body: some View{
            ZStack{
                Color.cafeAuLait
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        
                        Text(dia.name)
                            .font(.title)
                            .foregroundStyle(.liverChestnut)
                            .bold()
                        
                        ForEach(arrayAtividades, id: \.self) { a in
                            if a.nome == dia.name {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 270,height: 70)
                                        .foregroundStyle(.paleSilver)
                                        .cornerRadius(15)
                                    
                                    HStack{
                                        Spacer()
                                        VStack (alignment: .leading){
                                            Text(a.ativ)
                                                .font(.headline)
                                                .bold()
                                                .foregroundStyle(.liverChestnut)
                                            Text(a.horario)
                                                .font(.subheadline)
                                                .foregroundStyle(.cafeAuLait)
                                        }
                                        
                                        Spacer()
                                        Spacer()
                                        
                                        Button(action: {
                                            arrayAtividades.removeAll { $0.id == a.id }
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.deepDumpling)
                                        }
                                        
                                        Spacer()
                                        
                                    }
                                    .frame(width: 270,height: 70)
                                    
                                }
                            }
                        }
                    }
                }
            }
        
    }
}
    

#Preview {
    cronogramaView()
}
