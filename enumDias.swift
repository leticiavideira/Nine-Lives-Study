//
//  sheetViewCronograma.swift
//  Projeto Final
//
//  Created by Turma02-18 on 07/10/25.
//

import SwiftUI

enum dias: String, Codable, CustomStringConvertible {
    case segunda, terca, quarta, quinta, sexta, sabado, domingo
    
    var description: String {
        switch self {
        case .segunda:
            return "Segunda-Feira"
        case .terca:
            return "Terça-Feira"
        case .quarta:
            return "Quarta-Feira"
        case .quinta:
            return "Quinta-Feira"
        case .sexta:
            return "Sexta-Feira"
        case .sabado:
            return "Sábado"
        case .domingo:
            return "Domingo"
        }
    }
    
    var name: String { self.rawValue }
    
    static var headerCases: [dias] {
        [.segunda,
         .terca,
         .quarta,
         .quinta,
         .sexta,
         .sabado,
         .domingo]
    }
}
