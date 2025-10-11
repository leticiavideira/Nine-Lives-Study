
import SwiftUI



struct Pet: Hashable, Decodable {
    
    
    let nome: String
    let imagemNome: String
    let custo: Double
    var isComprado: Bool = false
    
}


var todosOsPetsIniciais: [Pet] = [
    Pet(nome: "Ramsés", imagemNome: "farao", custo: 50),
    Pet(nome: "Croc", imagemNome: "crocs", custo: 40),
    Pet(nome: "Bozo", imagemNome: "palhaco", custo: 30),
    Pet(nome: "Winx", imagemNome: "borboleta", custo: 20),
    Pet(nome: "Harry", imagemNome: "bruxo", custo: 60),
    Pet(nome: "Houston", imagemNome: "astronauta", custo:50)
]

