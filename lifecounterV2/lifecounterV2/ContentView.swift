//
//  ContentView.swift
//  lifecounterV2
//
//  Created by stlp on 4/22/24.
//

import SwiftUI

struct Player {
    var name: String
    var health: Int
    var lost: Bool
}

struct ContentView: View {
    @State private var players = [
        Player(name: "Player 1", health: 20, lost: false),
        Player(name: "Player 2", health: 20, lost: false),
        Player(name: "Player 3", health: 20, lost: false),
        Player(name: "Player 4", health: 20, lost: false)
    ]
    @State private var historyList = [String]()
    @State private var gameStarted = false
    @State private var healthChange = 5
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(players.indices, id: \.self) { index in
                        PlayerController(player: $players[index], gameStarted: $gameStarted, healthChange: $healthChange, historyList: $historyList)
                    }
                }
                
                VStack {
                    Stepper("Change Health Gain or Loss", value: $healthChange, in: 2...50)
                        .padding([.leading, .bottom, .trailing])
                    
                    HStack {
                        Button(action: {
                            if players.count < 8 {
                                players.append(Player(name: "Player \(players.count + 1)", health: 20, lost: false))
                            }
                        }) {
                            Text("Add Player")
                        }
                        .disabled(gameStarted)
                        
                        NavigationLink(destination: HistoryView(historyList: historyList)) {
                            Text("History")
                        }
                        
                        Button(action: {
                            resetGame()
                        }) {
                            Text("Reset")
                        }
                        
                        Button(action: {
                            if players.count > 2 {
                                players.removeLast()
                            }
                        }) {
                            Text("Minus Player")
                        }
                        .disabled(gameStarted)
                    }
                    .padding()
                }

                if gameStarted && players.filter({ !$0.lost }).count == 1 {
                    Text("Game over!")
                        .font(.title)
                    Button(action: {
                        resetGame()
                    }) {
                        Text("OK")
                    }
                    .padding()
                }
            }
        }
    }
    
    func resetGame() {
        players = [
            Player(name: "Player 1", health: 20, lost: false),
            Player(name: "Player 2", health: 20, lost: false),
            Player(name: "Player 3", health: 20, lost: false),
            Player(name: "Player 4", health: 20, lost: false)
        ]
        historyList.removeAll()
        gameStarted = false
        healthChange = 5
    }
}

#Preview {
    ContentView()
}
