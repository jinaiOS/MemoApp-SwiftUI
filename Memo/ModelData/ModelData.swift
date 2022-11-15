//
//  ModelData.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import Foundation

class ModelData: ObservableObject {
    @Published var memos: [Memo] = [] {
        didSet {
            save()
        }
    }
    
    let memoKey: String = "memo_list"
    
    init() {
        getList()
    }
    
    func getList() {
        guard
            let data = UserDefaults.standard.data(forKey: memoKey),
            let savedMemos = try? JSONDecoder().decode([Memo].self, from: data)
        else { return }
        
        self.memos = savedMemos
    }
    
    func addFolder(folder: String) {
        let newMemo = Memo(folder: folder, title: "", content: "")
        memos.append(newMemo)
    }
    
    func addMemo(folder: String, title: String, content: String) {
        let newMemo = Memo(folder: folder, title: title, content: content)
        memos.append(newMemo)
    }
    
    func remove(memo: Memo) {
        guard let index = memos.firstIndex(where: { $0.id == memo.id }) else { return }
        memos.remove(at: index)
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(encodedData, forKey: memoKey)
        }
    }
}
