//
//  DetailView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct DetailView: View {
    // viewmodel 선언할 때 주로 사용하는 프로퍼티래퍼
    // 프로토콜 준수하면 objectWillChange.send()라는 함수가 생기고 이 함수를 호출하면 뷰를 다시 그림
    //    @ObservedObject var memo: MemoEntity
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    // state의 변수값이 변경될 때 view 다시 계산하여 그림
    // view의 body에서만 접근해야 함 Private 선언 권장
    @State private var placeholderText: String = "내용을 입력하시오."
    @State private var content: String = ""
    @State var memo: Memo
    @Environment(\.dismiss) private var dismiss // 뒤로 가기
    
    var body: some View {
        VStack {
            TextField("제목을 입력하시오.", text: $memo.title)
                .font(.title)
                .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                if memo.content == "" { // text editor placeholder
                    TextEditor(text: $placeholderText)
                        .font(.body)
                        .foregroundColor(.gray)
                        .disabled(true)
                        .padding()
                }
                TextEditor(text: $memo.content)
                    .padding()
                    .opacity(self.content.isEmpty ? 0.25 : 1)
            }
        }
        .navigationBarTitleDisplayMode(.inline) // navigationtitle 자리 여백 삭제
        // Toolbar: 현재 컨텍스트와 연관됨
        // Tabbar: 현재 컨텍스트와 연관x
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                Button(action: {
                    guard let urlShare = URL(string: "https://developer.apple.com/xcode/swiftui/") else { return }
                    let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
                    UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                }, label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                    }
                })
                
                Menu {
                    
                    MenuHStackButton()
                    
                    Section {
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("메모에서 찾기")
                                
                                Image(systemName: "magnifyingglass")
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("메모 이동")
                                
                                Image(systemName: "folder")
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("줄 및 격자")
                                
                                Image(systemName: "rectangle.split.3x3")
                            }
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("삭제")
                                
                                Image(systemName: "trash")
                                
                            }
                        })
                    }
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
                
                Button(action: {
                    ModelData().addMemo(folder: memo.folder, title: memo.title, content: memo.content)
                    dismiss()
                }, label: {
                    Text("완료")
                })
            })
        })
    }
}
