import SwiftUI
import Foundation




class ConquistaViewModel: ObservableObject {
    @Published var conquistas: [Conquista] = []

    func fetchConquistas() {
        guard let url = URL(string: "http://192.168.128.32:1880/hackaluiz") else {
            print("URL inválida")
            return
        }

        let task =   URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
            guard  let data = data , error == nil else{
              
                return
            }


            do {
                let parsed = try  JSONDecoder().decode([Conquista].self, from: data)
                DispatchQueue.main.async{
                    self?.conquistas = parsed
                }
            } catch {
                print("Erro ao decodificar: \(error)")
            }
            
        }
        task.resume()
    }
}
