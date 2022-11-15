//
//  MemoApp.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import SwiftUI

@main
struct MemoApp: App {
    
//    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
//            .navigationViewStyle(StackNavigationViewStyle())
//            .environmentObject(listViewModel)
        }
    }
}
