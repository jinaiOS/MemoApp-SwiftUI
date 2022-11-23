//
//  ModelData.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import Foundation

class ModelData: ObservableObject {
    // MARK: About ObservableObject
    // (여러 프로퍼티나 메소드가 있거나, 여러 view에서 공유할 수 있는 커스텀 타입이 있는 경우) 더 복잡한 프로퍼티 대신 사용
    // State와 매우 유사 but 외부 참조 타입 사용
    // 변경되었음을 알리는 방법 중 간단한 방법: @Published 프로퍼티 래퍼 사용
    
    @Published var memos: [Memo] = [] {
        didSet {
            save()
        }
    }
    
    let memoKey: String = "memo_list"
    
    init() {
        getList()
    }
    
    var folders: [String: [Memo]] {
        Dictionary(
            grouping: memos,
            by: { $0.folder }
        ) // folder 명에 따른 grouping
    }
    
    func getList() {
        guard
            let data = UserDefaults.standard.data(forKey: memoKey), // userdefault data 저장
            let savedMemos = try? JSONDecoder().decode([Memo].self, from: data) // json decoding
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
        guard let index = memos.firstIndex(where: { $0.id == memo.id }) else { return } // 같은 게 아니라면 리턴
        memos.remove(at: index)
    }
    
    func store(memo: Memo) {
      if let index = memos.firstIndex(where: { $0.id == memo.id }) {
        memos[index] = memo
      } else {
        memos.insert(memo, at:0)
      }
    }
    
    func save() {
        if let encodedData = try? JSONEncoder().encode(memos) {
            UserDefaults.standard.set(encodedData, forKey: memoKey)
        }
    }
}
