//
//  MemoStore.swift
//  Memo
//
//  Created by 김지은 on 2022/11/10.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(title: "Hello", content: "Hello", insertData: Date.now, folder: "Hello"),
            Memo(title: "Awsome", content: "Awsome", insertData: Date.now.addingTimeInterval(3600 * -24), folder: "a"),
            Memo(title: "SwiftUI", content: "SwiftUI", insertData: Date.now.addingTimeInterval(3600 * -48), folder: "b"),
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(title: memo, content: memo, folder: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String, title: String, folder: String) {
        guard let memo = memo else {
            return
        }
        
        memo.content = content
        memo.title = title
        memo.folder = folder
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}

