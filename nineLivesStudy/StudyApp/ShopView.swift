import SwiftUI


struct ShopView: View {

    @Binding var todosOsPets: [Pet]
    
   
    @Binding var dinheiro: Double
    
    
    @Environment(\.dismiss) var dismiss
    
    
    var petsAVenda: [Pet] {
        todosOsPets.filter { !$0.isComprado }
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.paleSilver, Color.paleSilver]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    if petsAVenda.isEmpty {
                        Text("Todos os pets foram comprados!")
                            .foregroundColor(.secondary)
                            .padding()
                    } else {
                        
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) {
                                Text("Pets Disponíveis")
                                    .font(.headline)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                
                                
                                ForEach(petsAVenda, id: \.self) { pet in
                                    ShopItemRow(
                                        pet: pet,
                                        todosOsPets: $todosOsPets,
                                        dinheiro: $dinheiro
                                    )
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    
                                    
                                    Divider()
                                        .padding(.leading)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .navigationTitle("Loja de Pets")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(String(format: "%.2f", dinheiro))
                            .bold()
                            .foregroundColor(.liverChestnut)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Fechar") {
                            dismiss()
                        }
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}



struct ShopItemRow: View {
    let pet: Pet
    @Binding var todosOsPets: [Pet]
    @Binding var dinheiro: Double

    var podeComprar: Bool {
        dinheiro >= pet.custo
    }
    
    var body: some View {
        HStack {
           
            Image(pet.imagemNome)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            Text(pet.nome)
            
            Spacer()
            
            Text(String(format: "%.2f", pet.custo))
                .font(.headline)
                .foregroundColor(.liverChestnut)
            
            Button(action: comprarPet) {
                Text(podeComprar ? "Comprar" : String(format: "Falta $ %.2f",pet.custo - dinheiro))
                    .lineLimit(1)
            }
            .disabled(!podeComprar)
            .buttonStyle(.borderedProminent)
            .tint(podeComprar ? .liverChestnut : .gray)
        }
        .background(Color.clear)
    }
    
    func comprarPet() {
  
        guard podeComprar else { return }

       
        dinheiro -= pet.custo

      
        if let index = todosOsPets.firstIndex(of: pet) {
         
            todosOsPets[index].isComprado = true
            
        }
    }
}
