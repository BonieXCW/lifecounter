//
//  HistoryView.swift
//  lifecounterV2
//
//  Created by stlp on 4/22/24.
//

import SwiftUI

struct HistoryView: View {
    let historyList: [String]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(historyList, id: \.self) { historyString in
                    Text(historyString)
                }
            }
        }
        .navigationTitle("History")
    }
}
