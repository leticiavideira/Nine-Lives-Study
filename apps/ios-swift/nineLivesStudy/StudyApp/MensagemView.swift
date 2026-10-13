
import SwiftUI
import Foundation

struct MensagemView: View {
    let mensagem: Mensagem
    
    var body: some View {
       
                         
            HStack {
                if mensagem.remetente == .gemini {
                    
                    Text(mensagem.conteudo)
                        .padding(10)
                        .background(Color.cafeAuLait.opacity(0.8))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: .leading)
                    Spacer(minLength: 20)
                } else {
                
                    Spacer(minLength: 20)
                    Text(mensagem.conteudo)
                        .padding(10)
                        .background(Color.morningBlue.opacity(0.8))
                        .foregroundColor(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: .trailing)
                    
                }
            }
            .padding(.vertical, 4)
        }
    }

