//
//  ContentView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData // 전달 없이 공용으로 사용 가능
    @State private var searchText = "" // 변수값이 변경되면 view 를 다시 랜더링 하기 때문에 항상 최신 값을 가짐
    @State var showDetailView = false
    @State var showAddFolderView = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(uiColor: .secondarySystemBackground))
                
                List{
                    ForEach(modelData.memos) { memo in
                        NavigationLink {
                            ListView(memo: memo)
                        } label: {
                            Row(memo: memo)
                        }
                        .frame(height: 36)
                    }
                }
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
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .sheet(isPresented: $showAddFolderView) {
                AddFolderView(showAddFolderView: $showAddFolderView)
            }
        }
        .accentColor(.yellow) // navigationview 글자 색상
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
