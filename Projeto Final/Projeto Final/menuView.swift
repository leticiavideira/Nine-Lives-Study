//
//  menuView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 02/10/25.
//

import Foundation
import SwiftUI

struct menuView: View{
    
    @State var nome: String = ".........."
    @State var streak: Int = 780
    
    var body: some View {
        NavigationStack{
        ZStack{
            Color.paleSilver
                .ignoresSafeArea()
            
            
            ScrollView{
                
                    VStack{
                        
                        //LOGO
                        
                        
                        HStack{
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 175)
                            
                            Text("Nine Lives Study")
                                .bold()
                                .font(.largeTitle)
                            
                            Spacer()
                            Spacer()
                        }
                        Spacer()
                        
                        
                        //NOME
                        
                        
                        Text("Olá, \(nome)")
                            .font(.title)
                        
                        HStack{
                            
                            //GATO
                            
                            Image("cat")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                            
                            ZStack{
                                
                                //STREAK POSITIVA
                                
                                if streak != 0{
                                    if streak < 100{
                                        Rectangle()
                                            .foregroundColor(.deepDumpling)
                                            .frame(width: 125, height: 125)
                                            .cornerRadius(15.0)
                                        HStack{
                                            Text("\(streak)")
                                                .font(.system(size: 65))
                                                .bold()
                                                .foregroundStyle(.paleSilver)
                                            
                                            VStack{
                                                if streak == 1{
                                                    Text("dia")
                                                        .bold()
                                                        .foregroundStyle(.paleSilver)
                                                } else if streak > 1 {
                                                    Text("dias")
                                                        .bold()
                                                        .foregroundStyle(.paleSilver)
                                                }
                                                
                                                Image(systemName: "flame")
                                                    .foregroundColor(.paleSilver)
                                                    .font(.system(size: 27))
                                                
                                            }
                                        }
                                    } else {
                                        Rectangle()
                                            .foregroundColor(.deepDumpling)
                                            .frame(width: 125, height: 125)
                                            .cornerRadius(15.0)
                                        HStack{
                                            Text("\(streak)")
                                                .font(.system(size: 40))
                                                .bold()
                                                .foregroundStyle(.paleSilver)
                                            
                                            VStack{
                                                if streak == 1{
                                                    Text("dia")
                                                        .bold()
                                                        .foregroundStyle(.paleSilver)
                                                } else if streak > 1 {
                                                    Text("dias")
                                                        .bold()
                                                        .foregroundStyle(.paleSilver)
                                                }
                                                
                                                Image(systemName: "flame")
                                                    .foregroundColor(.paleSilver)
                                                    .font(.system(size: 27))
                                                
                                            }
                                        }
                                    }
                                } else {
                                    
                                    //STREAK = 0
                                    
                                    Rectangle()
                                        .foregroundColor(.gray)
                                        .frame(width: 125, height: 125)
                                        .cornerRadius(15.0)
                                    HStack{
                                        Text ("0")
                                            .font(.system(size: 80))
                                            .bold()
                                            .foregroundStyle(.paleSilver)
                                        VStack{
                                            Text("dias")
                                                .bold()
                                                .foregroundStyle(.paleSilver)
                                            Image(systemName: "flame")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 27))
                                        }
                                        
                                    }
                                }
                                
                                
                            }
                        }
                        Spacer()
                    }
                    
                //NAVIGATION
                
                    NavigationLink (destination: teste()){
                        HStack{
                            Image(systemName: "clock")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("Timer")
                                .font(.title2)
                        }
                                        }
                                        .padding()
                                        .frame(width: 270,height: 70)
                                        .background(.liverChestnut)
                                        .cornerRadius(15)
                                        .foregroundColor(.paleSilver)
                
                    NavigationLink (destination: cronogramaView()){
                        HStack{
                            Image(systemName: "calendar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("Cronograma")
                                .font(.title2)
                        }
                                        }
                                        .padding()
                                        .frame(width: 270,height: 70)
                                        .background(.liverChestnut)
                                        .cornerRadius(15)
                                        .foregroundColor(.paleSilver)
                
                    NavigationLink (destination: teste()){
                        HStack{
                            Image(systemName: "bubble.left.and.text.bubble.right.rtl")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("Dúvidas")
                                .font(.title2)
                        }
                                        }
                                        .padding()
                                        .frame(width: 270,height: 70)
                                        .background(.liverChestnut)
                                        .cornerRadius(15)
                                        .foregroundColor(.paleSilver)
                        
                    
                }
            
            
            
            
            }
        }
    }
}

#Preview {
    ContentView()
}
