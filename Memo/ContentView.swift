//
//  ContentView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var manager: CoreDataManager // 전달 없이 공용으로 사용 가능
    @State private var searchText = "" // 변수값이 변경되면 view 를 다시 랜더링 하기 때문에 항상 최신 값을 가짐
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\MemoEntity.insertDate, order: .reverse)])
    var memoList: FetchedResults<MemoEntity>
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .background(Color(uiColor: .secondarySystemBackground))
                
                List {
                    ForEach(memoList) { element in
                        NavigationLink {
                            ListView()
                        } label: {
                            Row(memo: element)
                        }
                    }
                    .frame(height: 36)
                }
            }
            .navigationTitle("폴더")
            .navigationBarItems(trailing: EditButton())
            .background(Color(uiColor: .secondarySystemBackground))
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "folder.badge.plus")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.pencil")
                    })
                }
            }
        }
        .accentColor(.yellow) // navigationview 글자 색상
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CoreDataManager.shared)
            .environment(\.managedObjectContext, CoreDataManager.shared.mainContext)
    }
}
