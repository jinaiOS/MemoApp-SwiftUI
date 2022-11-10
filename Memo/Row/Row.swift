//
//  Row.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct Row: View {
    @ObservedObject var memo: MemoEntity
    
    var body: some View {
        Image(systemName: "folder")
            .foregroundColor(.yellow)
        
        Text(memo.folder ?? "")
        
        Spacer() // View 간의 간격을 띄우고 싶을 때
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        Row(
            memo: MemoEntity(context: CoreDataManager.shared.mainContext)
        )
    }
}
