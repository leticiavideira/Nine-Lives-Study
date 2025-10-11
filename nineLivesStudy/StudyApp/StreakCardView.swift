//
//  StreakCardView.swift
//  Clock
//
//  Created by Turma02 on 10/10/25.
//

import SwiftUI

struct StreakCardView: View {
    @StateObject var manager: StreakManager
    var title: String

    var body: some View {
        VStack(spacing: 10) {

            if manager.streak != 0 {
                if manager.streak < 100 {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.deepDumpling)
                            .frame(width: 125, height: 125)
                            .cornerRadius(15.0)
                        
                        HStack {
                            Text("\(manager.streak)")
                                .font(.system(size: 65))
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            VStack {
                                if manager.streak == 1 {
                                    Text("dia")
                                        .bold()
                                        .foregroundStyle(.paleSilver)
                                } else if manager.streak > 1 {
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
                    ZStack {
                        Rectangle()
                            .foregroundColor(.deepDumpling)
                            .frame(width: 125, height: 125)
                            .cornerRadius(15.0)
                        
                        HStack {
                            Text("\(manager.streak)")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundStyle(.paleSilver)
                            
                            VStack {
                                if manager.streak == 1 {
                                    Text("dia")
                                        .bold()
                                        .foregroundStyle(.paleSilver)
                                } else if manager.streak > 1 {
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
                }
            } else {
                // STREAK = 0
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 125, height: 125)
                        .cornerRadius(15.0)
                    
                    HStack {
                        Text("0")
                            .font(.system(size: 80))
                            .bold()
                            .foregroundStyle(.paleSilver)
                        
                        VStack {
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
    }
}
