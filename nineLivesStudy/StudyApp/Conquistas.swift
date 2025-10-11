//
//  Conquistas.swift
//  StudyApp
//
//  Created by Turma02-19 on 08/10/25.
//

import Foundation

struct conquistaResponse: Decodable{
    
    let conquistas: [Conquista]
    
}

struct Conquista: Hashable, Decodable{
    
    let _id: String
    let _rev: String
    let meta: Double
    let nome: String
    let imagemBlock: String
    let imagemUnlock: String
    let descricao: String
    
    
}

