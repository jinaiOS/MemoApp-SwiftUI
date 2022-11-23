//
//  Memo.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import Foundation

// key path와 identifiable protocol
// key path: list에 unique identifier, UUID를 사용하면 매번 객체가 생성될 때 Unique Identifier를 만들 수 있음
// identifiable protocol: keypath 따로 안 넘겨줘도 됨, 이미 id 프로퍼티가 있으므로 채택 후에 할 일이 없음

struct Memo: Codable, Identifiable {
    var id: String
    var folder : String
    var title : String
    var content : String
    
    init(id: String = UUID().uuidString, folder: String, title: String, content: String) {
        self.id = id
        self.folder = folder
        self.title = title.isEmpty ? "제목을 입력하세요." : title
        self.content = content.isEmpty ? "내용을 입력하세요." : content
    }
}

// MARK: About UUID(Universally Unique IDentifier) : 범용 고유 식별자
// 중복될 가능성이 거의 없다
// 총 36개 문자로 이루어짐
// UUID 생성 방법: UUID(), UUID(),uuidString - String값 필요할 때
// RFC 4122 버전 4의 무작위UUID 생성 방법을 사용
