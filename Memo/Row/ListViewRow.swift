//
//  ListViewRow.swift
//  Memo
//
//  Created by 김지은 on 2022/11/07.
//

import SwiftUI

struct ListViewRow: View {
    var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.title)
                .font(.headline)
            
            HStack {
                Image(systemName: "folder")
                
                Text(memo.folder)
                    .font(.subheadline)
            }
            .foregroundColor(.gray)
            .padding(-0.1)
            .frame(height: 50)
        }
    }
}
