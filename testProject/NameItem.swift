//
//  NameItem.swift
//  testProject
//
//  Created by Mateus on 06/04/25.
//

import SwiftUI

struct NameItem: View {
    let onDelete: () -> Void
    let convidado: Convidado
    let onToggleFavorite: () -> Void
    
    var body: some View {
        HStack {
            Text(convidado.nome)
                .font(.headline)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button(action: onToggleFavorite ) {
                
                Image(systemName: convidado.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.yellow)
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: onDelete) {
                
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
    }
}
