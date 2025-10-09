//
//  listaAtividadesView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 08/10/25.
//

import Foundation
import SwiftUI

struct ListaAtividadesView: View{
    
    @State var dia: dias
    @Binding var arrayAtividades: [Atividade]
    
    var body: some View{
        ZStack{
            Color.paleSilver
                .ignoresSafeArea()
            
            VStack{
                ForEach(arrayAtividades, id: \.self) { a in
                    if a.nome == dia.name {
                        Text(a.ativ)
                        Text(a.horario)
                    }
                }
            }
        }
        
    }
}

#Preview {
    cronogramaView()
}
