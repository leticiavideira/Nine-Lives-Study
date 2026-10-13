
//
//  ContentView.swift
//  projeto
//
//  Created by Turma02-11 on 02/10/25.
//

import SwiftUI

struct perfilView: View {


@State  var materias: [String] = []


@State var mostrarSheet = false
@Binding var tempoEstudado: Double
@ObservedObject var manager: StreakManager
@State var novaMateria: String = ""
@Binding var Nome: String

var body: some View {

    NavigationStack{
        ZStack{
            
            Color.paleSilver
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    
                    Button {
                        mostrarSheet.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)
                    }
                    .sheet(isPresented: $mostrarSheet){
                        SheetView(nome: $Nome)
                    }
                    
                    
                    HStack{
                        
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding()
                        
                        
                        
                        Text("\(Nome)")
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .font(.title)
                            .bold()
                        
                        
                    }
                    
                    HStack{
                        
                        VStack{
                            
                            NavigationLink(destination: ConquistasView(tempoEstudado: $tempoEstudado)){
                                
                                HStack{
                                    Image(systemName: "medal")
                                        .resizable()
                                        .frame(width: 35, height: 50)
                                        .foregroundColor(.black)
                                        .padding(5)
                                    
                                    Text("Conquistas")
                                    
                                        .font(.title2)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 180 ,height: 80)
                            .background(Color.cafeAuLait)
                            .cornerRadius(10)
                            
                            
                            
                            VStack{
                                ScrollView{
                                    
                                    NavigationLink(destination: MATERIAS(materias: $materias, novaMateria: $novaMateria)) {
                                        Text("Matérias")
                                            .font(.title)
                                            .foregroundColor(.black)
                                    }
                                    
                                    
                                    VStack(alignment: .leading){
                                        ForEach(materias, id: \.self) { a in
                                            
                                            HStack{
                                                Circle()
                                                    .frame(width: 8)
                                                
                                                Text("\(a)")
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            .frame(width: 180, height: 200)
                            .background(Color.cafeAuLait)
                            .cornerRadius(10)
                            
                        }
                        
                        
                        VStack{
                            ZStack{
                                StreakCardView(manager: manager, title: "Dias")

                            }
                            
                            ZStack{
                                
                                VStack{
                                    Text(String(format: "%.0f", tempoEstudado/60))
                                        .font(.title)
                                    Text("min de foco")
                                }
                                .frame(width: 125, height: 100)
                                .background(.cafeAuLait)
                                .cornerRadius(15)
                            }
                        }
                        
                    }
                    
                    
                    
                }
                .padding()
                
            }
        }
    }
    .tint(Color.liverChestnut)
}
}


//
//#Preview {
//    perfilView(manager: StreakManager(key: "DayStreak"), Nome: <#Binding<String>#>)
//}
