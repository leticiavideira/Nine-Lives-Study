//
//  ContentView.swift
//  Projeto Final
//
//  Created by Turma02-18 on 02/10/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
            TabView{
                
                menuView()
                    .tabItem{
                        Label("Menu", systemImage: "line.3.horizontal")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.paleSilver, for: .tabBar)
                
                teste()
                    .tabItem{
                        Label("Pets", systemImage: "pawprint")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.hidden, for: .tabBar)
                
                teste()
                    .tabItem{
                        Label("Perfil", systemImage: "person")
                            .foregroundStyle(.green)
                    }
                    .toolbarBackground(.hidden, for: .tabBar)
                
               
            }
        }
    }


#Preview {
    ContentView()
}
