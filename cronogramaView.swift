//
//  cronogramaView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 06/10/25.
//

import SwiftUI

struct Atividade: Hashable, Codable {
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
                
                VStack{
                    NavigationLink(destination: addView(arrayAtividades: $arrayAtividades)){
                        HStack{
                            Text("+")
                                .font(.title2)
                        }
                    }
                    .padding()
                    .frame(width: 270,height: 70)
                    .background(.paleSilver)
                    .cornerRadius(15)
                    .foregroundColor(.morningBlue)
                    
                    
                    
                    ForEach(dias.headerCases, id: \.self) { i in
                                            
                        VStack{
                            NavigationLink(destination: ListaAtividadesView(dia: i, arrayAtividades: $arrayAtividades)){
                                Text(i.name)
                            }
                            .padding()
                            .frame(width: 270,height: 70)
                            .background(.paleSilver)
                            .cornerRadius(15)
                            .foregroundColor(.morningBlue)
                            
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

