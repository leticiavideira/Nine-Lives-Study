import SwiftUI

enum dias: String, Codable, CustomStringConvertible {
    case Segunda, Terça, Quarta, Quinta, Sexta, Sabado, Domingo
    
    var description: String {
        switch self {
        case .Segunda:
            return "Segunda-Feira"
        case .Terça:
            return "Terça-Feira"
        case .Quarta:
            return "Quarta-Feira"
        case .Quinta:
            return "Quinta-Feira"
        case .Sexta:
            return "Sexta-Feira"
        case .Sabado:
            return "Sábado"
        case .Domingo:
            return "Domingo"
        }
    }
    
    var name: String { self.rawValue }
    
    static var headerCases: [dias] {
        [.Segunda,
         .Terça,
         .Quarta,
         .Quinta,
         .Sexta,
         .Sabado,
         .Domingo]
    }
}
