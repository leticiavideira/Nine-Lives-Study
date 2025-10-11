//
//  RecebeMaterias.swift
//  projeto
//
//  Created by Turma02-11 on 07/10/25.
//

import SwiftUI

struct MATERIAS: View {
    @Binding var materias: [String]
    @Binding var novaMateria: String
    
    var body: some View {
        ZStack{
            
            Color.paleSilver
                .ignoresSafeArea()
               
            
            
            ScrollView{
                
                VStack{
                    TextField("Nova matéria", text: $novaMateria)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 5)
                    
                    Button(action: {
                        if !novaMateria.trimmingCharacters(in: .whitespaces).isEmpty {
                            materias.append(novaMateria)
                            novaMateria = ""
                        }
                    }) {
                        Label("Adicionar Matéria", systemImage: "plus.circle.fill")
                            .foregroundColor(.white)
                            .padding(6)
                            .background(Color.liverChestnut)
                            .cornerRadius(8)
                    }
                    ForEach(materias.indices, id: \.self) { index in
                        HStack {
                            Text(materias[index])
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                materias.remove(at: index)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(5)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
}
//#Preview {
//    perfilView()
//}
