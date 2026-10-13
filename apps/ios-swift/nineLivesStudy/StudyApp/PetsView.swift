import SwiftUI


struct OwnedPetGridItem: View {
    let pet: Pet
    
    var body: some View {
        
        VStack {
            
            Image(pet.imagemNome)
                .resizable()
                .scaledToFit()
                
               
        }
    }
}




struct PetsView: View {
    @State private var todosOsPets: [Pet] = todosOsPetsIniciais
    @Binding var dinheiro: Double
    @State private var showingShop = false
    

    let colunas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var petsComprados: [Pet] {
        todosOsPets.filter { $0.isComprado }
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
                    
                    if petsComprados.isEmpty {
                        Text("Você ainda não comprou nenhum pet. Visite a loja!")
                            .foregroundColor(.black)
                            .padding()
                    } else {
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                
                                LazyVGrid(columns: colunas, spacing: 15) {
                                    ForEach(petsComprados, id:\.self) { pet in
                                        OwnedPetGridItem(pet: pet)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .navigationTitle("Pets")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Loja 🛒") {
                            showingShop = true
                        }.foregroundStyle(.black)
                    }
                }
                .sheet(isPresented: $showingShop) {
                    
                    ShopView(todosOsPets: $todosOsPets, dinheiro: $dinheiro)
                }
            } 
        }
    }
}

//#Preview {
//    PetsView()
//}
