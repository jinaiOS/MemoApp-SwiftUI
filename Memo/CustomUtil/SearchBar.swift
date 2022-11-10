//
//  SearchBar.swift
//  Memo
//
//  Created by 김지은 on 2022/11/07.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String // 뷰 변화를 바로 반영할 수 있도록, 외부에서 접근해야 하기 때문에 private X
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass") // 시스템 이미지 이름 모아둔 앱 "SF Symbols" <- 애플 자체 앱
                
                TextField("Search", text: $searchText) // $가 붙으면 프로퍼티 래퍼 자체를 받음(사용시에는 $를 앞에 붙여 binding 변수임을 나타냄)
                    .foregroundColor(.primary)
                
                if !searchText.isEmpty {
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
            }
            .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
            .foregroundColor(.secondary)
            .background(Color(.systemGray5))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

