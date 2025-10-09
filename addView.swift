//
//  addView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 08/10/25.
//

import Foundation
import SwiftUI

struct addView: View{
    
    @State var selectDia : dias = dias.domingo
    @State var horas: String = ""
    @State var ativ: String = ""
    //    @State var dia : dias
    @Binding var arrayAtividades: [Atividade]
    
    var body: some View{
        ZStack{
            Color.paleSilver
                .ignoresSafeArea()
            
            VStack{
                TextField("Nova Atividade", text: $ativ)
                TextField("Horário", text: $horas)
                
                Picker("Seleciona dia", selection: $selectDia) {
                    ForEach(dias.headerCases, id: \.self) { d in
                        Text(d.name)
                    }
                }
                .pickerStyle(.menu)
                
                
                Button("adicionar"){
                    arrayAtividades.append(Atividade(nome: selectDia.rawValue, horario: horas, ativ: ativ))
                    print(arrayAtividades)
                }
            }
        }
    }
}

#Preview {
    addView(arrayAtividades: .constant([]))
}

