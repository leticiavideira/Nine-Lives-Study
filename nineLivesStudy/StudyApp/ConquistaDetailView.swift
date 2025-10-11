//
//  ConquistaDetailView.swift
//  StudyApp
//
//  Created by Turma02-19 on 24/10/25.
//

import SwiftUI

struct ConquistaDetailView: View {
    
    var Descricao:String
    var Nome: String
    
    var body: some View {
        ZStack{
            Color.paleSilver
                .ignoresSafeArea()
            
            VStack{
                
                ZStack{
                    
                    Circle()
                        .foregroundColor(Color.blue)
                        .frame(width: 110,height: 110)
                    
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 90,height: 90)
                        .frame(alignment: .center)
                    
                
                
            }
                Text("\(Nome)")
                    .font(.title)
                
                Text("\(Descricao)")
                
            }
        }
        
        
        
    }
}

