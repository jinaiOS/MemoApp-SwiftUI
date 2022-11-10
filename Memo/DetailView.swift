//
//  DetailView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: MemoEntity
    
    @EnvironmentObject var manager: CoreDataManager
    @State var placeholderText: String = "내용을 입력하시오."
    @Environment(\.dismiss) private var dismiss // 뒤로 가기
    
    var body: some View {
        VStack {
            Text(memo.content ?? "")
                .font(.title)
            
//            ZStack(alignment: .leading) {
//                if memo.content.isEmpty { // text editor placeholder
//                    TextEditor(text: $placeholderText)
//                        .font(.body)
//                        .foregroundColor(.gray)
//                        .disabled(true)
//                        .padding()
//
//                }
//                TextEditor(text: $content)
//                    .padding()
//                    .opacity(self.content.isEmpty ? 0.25 : 1)
//            }
        }
        .navigationBarTitleDisplayMode(.inline) // navigationtitle 자리 여백 삭제
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
            })
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(memo: MemoEntity(context: CoreDataManager.shared.mainContext))
                .environmentObject(CoreDataManager.shared)
        }
    }
}
