//
//  NameItem.swift
//  testProject
//
//  Created by Mateus on 06/04/25.
//

import SwiftUI

struct NameItem: View {
    let nome: String
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            Text(nome)
                .font(.headline)
                .foregroundColor(.indigo)
            
            Spacer()
            
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
