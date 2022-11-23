//
//  DetailView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct DetailView: View {
    //MARK: About Environment
    // viewmodel 선언할 때 주로 사용하는 프로퍼티래퍼
    // 프로토콜 준수하면 objectWillChange.send()라는 함수가 생기고 이 함수를 호출하면 뷰를 다시 그림
    //    @ObservedObject var memo: MemoEntity
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) private var dismiss // 뒤로 가기
    
    @State private var placeholderText: String = "내용을 입력하시오."
    @State var memo: Memo

    var onSave: (Memo) -> ()
    var onDelete: (Memo) -> ()
    
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("제목을 입력하시오.", text: $memo.title, onEditingChanged: { _ in
                self.onSave(self.memo)
            })
            .font(.title)
            .padding(.horizontal)
            
            TextField("제목을 입력하시오.", text: $memo.title)
                .font(.title)
                .padding(.horizontal)
            
            ZStack(alignment: .leading) {
                TextEditor(text: $placeholderText)
                    .padding()
                    .opacity(memo.content.isEmpty ? 1 : 0)
                    .disabled(true)
                    .foregroundColor(.gray)
                TextEditor(text: $memo.content)
                    .padding()
                    .opacity(memo.content.isEmpty ? 0.25 : 1)
                    .foregroundColor(.black)
            }
        }
        .onAppear {
            print("메모 상세 화면")
        }
        .navigationBarTitleDisplayMode(.inline)// navigationtitle 자리 여백 삭제
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
                            self.presentationMode.wrappedValue.dismiss()
                            self.onDelete(self.memo)
                            print("메모 삭제")
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
                    self.onSave(self.memo)
                    dismiss()
                    print("완료 및 저장")
                }, label: {
                    Text("완료")
                })
            })
        })
    }
}
