//
//  MemoApp.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

@main
struct MemoApp: App {
    let manager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CoreDataManager.shared)
                .environment(\.managedObjectContext, CoreDataManager.shared.mainContext)
        }
    }
}
