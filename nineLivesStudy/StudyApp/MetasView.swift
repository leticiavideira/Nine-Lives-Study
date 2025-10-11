


import SwiftUI

struct MetasView: View {
    @State private var novaMeta: String = ""
    @State private var metas: [String] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Metas")
                .font(.title2)
                .bold()
            
            HStack {
                    TextField("Digite uma nova meta", text: $novaMeta)
                        .padding(10)
                        .background(.paleSilver)
                        .cornerRadius(10)

                Button(action: adicionarMeta) {
                    Image(systemName: "plus.app.fill")
                        .font(.title2)
                        .foregroundColor(.liverChestnut)
                }
                .disabled(novaMeta.trimmingCharacters(in: .whitespaces).isEmpty)
            }

            ForEach(metas, id: \.self) { meta in
                Text("• \(meta)")
                    .font(.body)
            }
        }
        .padding()
    }

    func adicionarMeta() {
        let texto = novaMeta.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !texto.isEmpty else { return }
        metas.append(texto)
        novaMeta = ""
    }
}
