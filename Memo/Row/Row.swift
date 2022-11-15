//
//  Row.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct Row: View {
    var memo: Memo
    
    var body: some View {
        Image(systemName: "folder")
            .foregroundColor(.yellow)
        
        Text(memo.folder)
        
        Spacer() // View 간의 간격을 띄우고 싶을 때
    }
}
