//
//  Memo.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID
    @Published var content: String
    @Published var title: String
    @Published var folder: String
    let insertData: Date
    
    init(title: String, content: String, insertData: Date = Date.now, folder: String) {
        id = UUID()
        self.content = content
        self.insertData = insertData
        self.title = title
        self.folder = folder
    }
}
