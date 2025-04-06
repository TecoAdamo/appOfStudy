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
    
    var body: some View {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.indigo, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    
                    Text("Convit")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    
                    VStack(spacing: 16) {
                        TextField("Insira um nome para o convite:  ", text: $nomeDigitado)
                            .padding()
                            .background(Color.white.opacity(0.15))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                        
                        Button(action: validateTextField) {
                            Text("Adicionar")
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .foregroundColor(.indigo)
                                .cornerRadius(12)
                                .shadow(radius: 3)
                        }
                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .font(.headline)
                                .padding(.top, -8)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                    Divider().background(.white.opacity(0.2))
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(listaNomes, id: \.self) { nome in
                                NameItem(nome: nome){
                                    removeName(nome)
                                }
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                            }
                            .animation(.easeInOut, value: listaNomes)
                            }
                        
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
        }
    func validateTextField() {
        let nomeLimpo = nomeDigitado.trimmingCharacters(in: .whitespaces)

        if nomeLimpo.isEmpty {
            errorMessage = "Preencha o input para cadastrar"
        } else {
            listaNomes.append(nomeLimpo)
            nomeDigitado = ""
            errorMessage = ""
        }
    }
    func removeName(_ nome: String){
        withAnimation {
            if let index = listaNomes.firstIndex(of: nome) {
                listaNomes.remove(at: index)
            }
        }
    }
}

#Preview {
    AddContent()
}
