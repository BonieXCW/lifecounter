//
//  PlayerController.swift
//  lifecounterV2
//
//  Created by stlp on 4/22/24.
//

import SwiftUI

struct PlayerController: View {
    @Binding var player: Player
    @Binding var gameStarted: Bool
    @Binding var healthChange: Int
    @Binding var historyList: [String]
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            
            Button(action: {
                self.showingAlert = true
            }) {
                Text(player.name)
            }
            .alert("Enter your name", isPresented: $showingAlert) {
                TextField("Enter your name", text: $player.name)
            }
            
            HStack(spacing: 50) {
                Button(action: {
                    adjustHealth(health: -healthChange, message: "Lost \(healthChange) Life")
                }, label: {
                    Text("-\(healthChange)")
                })
                .disabled(player.lost)
                Button(action: {
                    adjustHealth(health: -1, message: "Lost 1 Life")
                }, label: {
                    Text("-1")
                })
                .disabled(player.lost)
                Text(String(player.health))
                Button(action: {
                    adjustHealth(health: 1, message: "Gain 1 Life")
                }, label: {
                    Text("+1")
                })
                .disabled(player.lost)
                Button(action: {
                    adjustHealth(health: healthChange, message: "Gain \(healthChange) Life")
                }, label: {
                    Text("+\(healthChange)")
                })
                .disabled(player.lost)
            }
        }
        .padding()
    }
    
    func adjustHealth(health: Int, message: String) {
        player.health += health
        gameStarted = true
        historyList.append("\(player.name) \(message)")
        if(player.health <= 0) {
            player.lost = true
            historyList.append("\(player.name) Loses!")
        }
    }
}
