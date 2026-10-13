
//
//  SheetView.swift
//  projeto
//
//  Created by Turma02-11 on 06/10/25.
//

import SwiftUI

        struct SheetView: View {
            
            @Binding var nome: String

            var body: some View {
                ZStack{
                    Color.paleSilver
                        .ignoresSafeArea()
                    VStack(spacing: 20) {
                        Text("Digite seu nome:")
                        
                        TextField("Seu nome aqui", text: $nome)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        
                    }
                    .padding()
                }
            }
        }

        
