//
//  ContentView.swift
//  testProject
//
//  Created by Mateus on 06/04/25.
//

import SwiftUI

struct ContentView: View {
    
    let tasks  =  ["Estudar SwiftUI", "Ler 5 paginas de um  livro", "Enviar curriculo para novas vagas"]
    
    var body: some View {
        NavigationStack {
            NavigationLink("Go to List") {
                VStack{
                    List {
                        Section(header: Text("Tasks").foregroundColor(.gray)) {
                            ForEach(tasks, id: \.self) { task in
                                Text(task)
                            }
                        }
                    }
                    .navigationTitle("List Tasks")
                }
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
