import SwiftUI
import GoogleGenerativeAI



enum Remetente {
    case eu
    case gemini
}

struct Mensagem: Identifiable {
    let id = UUID()
    let conteudo: String
    let remetente: Remetente
}



struct AssistenteDuvidasView: View {

    
    @State var duvidaInput = ""
    @State private var mensagens: [Mensagem]
    
    
    @State private var chat: Chat
    
   
    private let tutorConfig = GenerationConfig()
    
    
    
    init() {
        
        let model = GenerativeModel(name: "gemini-2.0-flash", apiKey: APIKey.default)
        
       
        let initialChat = model.startChat()
        let initialMessages = [
            Mensagem(conteudo: "Olá! Sou seu tutor de IA. Em que matéria posso te ajudar hoje?", remetente: .gemini)
        ]
        
   
        _chat = State(initialValue: initialChat)
        _mensagens = State(initialValue: initialMessages)
    }

 
    func sendMessage() {
        
        guard !duvidaInput.isEmpty else { return }
        
        let currentQuestion = duvidaInput
        

        mensagens.append(Mensagem(conteudo: currentQuestion, remetente: .eu))
        
       
        duvidaInput = ""
        let placeholderID = UUID()
       
        
        Task {
            do {
              
                let response = try await chat.sendMessage(currentQuestion)
                
                
                mensagens.removeAll { $0.id == placeholderID }
                
                guard let text = response.text else {
                    mensagens.append(Mensagem(conteudo: "Desculpe, não consegui processar a dúvida. Tente novamente.", remetente: .gemini))
                    return
                }
                
               
                mensagens.append(Mensagem(conteudo: text, remetente: .gemini))
                
            } catch {
               
                mensagens.removeAll { $0.id == placeholderID }
                mensagens.append(Mensagem(conteudo: "Ocorreu um erro: \(error.localizedDescription)", remetente: .gemini))
            }
        }
    }
    
  
    var body: some View {
        
        ZStack{
            
            LinearGradient(
                             gradient: Gradient(colors: [Color.paleSilver, Color.paleSilver]),
                             startPoint: .topLeading,
                             endPoint: .bottomTrailing
                         )
                         .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                ScrollView {
                    ScrollViewReader { proxy in
                        ForEach(mensagens) { mensagem in
                            MensagemView(mensagem: mensagem)
                                .id(mensagem.id)
                        }
                      
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    TextField("Digite sua dúvida...", text: $duvidaInput)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                    
                    Button(action: sendMessage) {
                        Image(systemName: "paperplane.fill")
                    }
                    .disabled(duvidaInput.isEmpty)
                }
                .padding()
            }
        }
    }
}






#Preview {
    AssistenteDuvidasView()
}
