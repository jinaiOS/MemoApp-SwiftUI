//
//  MemoApp.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import SwiftUI

@main
struct MemoApp: App {
    
    var body: some Scene {
        WindowGroup {
                ContentView()
                    .environmentObject(ModelData())
        }
    }
}
