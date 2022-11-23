//
//  ContentView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

// Swiftui에서 구조체 사용 이유: 클래스보다 더 빠름
struct ContentView: View { // Scene의 Content 형성, 플랫폼에서 독립적으로 표시 가능
    
    // MARK: About EnvironmentObject
    // 전달 없이 공용으로 사용 가능
    // 반드시 environmentObject (_ :) 메소드를 호출하여 상위 뷰에서 모델 객체를 설정
    @EnvironmentObject var modelData: ModelData
    
    // MARK: About State
    // state의 변수값이 변경될 때 view 다시 계산하여 그림
    // value 자체가 아님, 읽고 변경하는 수단 / 기본값에 접근하려면 value 프로퍼티 사용
    // single source of truth로 사용(정보 모형과 관련된 데이터 스키마를 모든 데이터 요소를 한 곳에서만 제어 또는 편집하도록 조직하는 관례)
    // view의 body에서만 접근해야 함 Private 선언 권장
    // view 외부에서 "절대" 사용되지 않은 간단한 프로퍼티에 적합
    @State private var searchText = ""
    @State var showAddFolderView = false
    
    var body: some View { // body 프로퍼티 요구, view 프로토콜을 준수하는 인스턴스 리턴
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(uiColor: .secondarySystemBackground))
                
                List {
                    // $0: 첫번째 인수 Closure
                    ForEach(modelData.folders.keys.sorted().filter{$0.contains(searchText) || searchText == ""}, id: \.self) { key in
                        NavigationLink {
                            ListView(memo: modelData.folders[key]!, memoTitle: key)
                        } label: {
                            Row(folderName: key)
                        }
                        .frame(height: 36)
                    }
                    .onDelete(perform: onDelete)
                    .onMove(perform: onMove)
                }
            }
            .task {
                print("첫 화면")
            }
            .navigationTitle("폴더")
            .navigationBarItems(trailing: EditButton())
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        self.showAddFolderView.toggle()
                    }, label: {
                        Image(systemName: "folder.badge.plus")
                    })
                    
                    Spacer()
                    
                    NavigationLink {
                        ForEach(modelData.memos) { memo in
                            DetailView(memo: memo, onSave: { memo in
                                self.modelData.store(memo: memo)
                            }, onDelete: { memo in self.modelData.remove(memo: memo)})
                        }
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $showAddFolderView) {
                AddFolderView()
                // modal present toggle sheet
            }
        }
        .accentColor(.yellow) // navigationview 글자 색상
    }
    
    private func onDelete(offsets: IndexSet) {
        modelData.memos.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        modelData.memos.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

//화면 터치시 키보드 숨김
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
