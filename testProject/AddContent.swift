//
//  AddContent.swift
//  testProject
//
//  Created by Mateus on 06/04/25.
//

import SwiftUI

struct AddContent: View {
    
// @State: usamos para armazenar valores que podem mudar, como o texto do input.
    @State private var nomeDigitado = ""
    @State private  var errorMessage = ""
    @State private var listaNomes: [String] = []
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.cyan, .green]),
                    // startPoint vamos dizer onde comeca o degrade
                    startPoint: .topLeading,
                    // endPoint informamos onde termina o degrade
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 34) {
                    
                    Text("Convit")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 16) {
                        TextField("Insira um nome para o convite:  ", text: $nomeDigitado)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                        
                        Button(action: validateTextField) {
                            HStack {
                                Text("Adicionar")
                                    .fontWeight(.semibold)
                                Image(systemName: "plus.app.fill") 
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(12)
                            .shadow(radius: 3)
                        }

                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .font(.headline)
                                .foregroundColor(.white)
                                
                        }
                    }
                    .padding(24)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(listaNomes, id: \.self) { nome in
                                NameItem(nome: nome){
                                    removeName(nome)
                                }
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                            }
                            .animation(.snappy, value: listaNomes)
                            }
                        
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
        }
    func validateTextField() {
        // aqui retira espacos em branco
        let nomeLimpo = nomeDigitado.trimmingCharacters(in: .whitespaces)

        // aqui checamos se esta vazio
        if nomeLimpo.isEmpty {
            // se estiver vazio, exibimos o errorMessage
            errorMessage = "Preencha o input para cadastrar"
        } else {
            //senao estiver vazio, add o nome na lista e depois setamos pra " " vazia novamente
            listaNomes.append(nomeLimpo)
            nomeDigitado = ""
            errorMessage = ""
        }
    }
    func removeName(_ nome: String){
        withAnimation {
            // aqui ta "procure o índice (posição) desse nome dentro da lista listaNomes. Se encontrar, me dá esse índice.
            if let index = listaNomes.firstIndex(of: nome) {
                // Se o índice foi encontrado, ai remove o nome daquela posição na lista.
                listaNomes.remove(at: index)
            }
        }
    }
}

#Preview {
    AddContent()
}
