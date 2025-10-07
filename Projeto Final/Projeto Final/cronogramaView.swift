//
//  cronogramaView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 06/10/25.
//

import SwiftUI

struct Atividade: Identifiable {
    var id = UUID()
    var nome: String
    var horario: String
}
struct Dia: Identifiable {
    var id = UUID()
    var nome: String
    var atividades: [Atividade]
}

struct cronogramaView: View {
    @State var atividades = [
        Atividade(nome: "Estudar Matemática", horario: "08:00 - 09:00"),
        Atividade(nome: "Inglês", horario: "09:30 - 10:30"),
        Atividade(nome: "Revisão", horario: "14:00 - 15:00")
    ]
    
    var body: some View {
        ZStack{
            Color.morningBlue
                .ignoresSafeArea()
            ScrollView (.horizontal){
                HStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    ScrollView{
                        VStack{
                            Text ("Segunda - Feira")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Terça - Feira")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Quarta - Feira")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Quinta - Feira")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Sexta - Feira")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Sábado")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    ScrollView{
                        VStack{
                            Text ("Domingo")
                                .font(.title2)
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            ForEach(atividades) { atividade in
                                VStack{
                                    ZStack{
                                        Rectangle()
                                            .foregroundColor(.paleSilver)
                                            .frame(width: 300, height: 100)
                                            .cornerRadius(15.0)
                                        
                                        VStack (alignment: .leading){
                                            Text(atividade.nome)
                                                .font(.headline)
                                            Text(atividade.horario)
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

