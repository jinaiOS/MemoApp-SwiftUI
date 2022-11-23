//
//  MemoApp.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import SwiftUI

@main // 앱의 진입점을 제공하기 위해 타입 앞에 @main attribute를 추가해야 함
struct MemoApp: App { // 앱의 구조와 동작을 나타내는 타입, 앱에는 하나의 뷰만 적어야 함
    var body: some Scene { // 시스템에서 관리 life cycle이 있는 앱 UI 일부
        WindowGroup { // 자동으로 여러 Window
                ContentView()
                    .environmentObject(ModelData())
            // MARK: About EnvironmentObject
            // 앱의 어느곳에서나 공유할 수 있는 데이터
        }
    }
}
// 각 Scene은 UI는 공유하지만, 모두 자신만의 독립적인 State 가짐
// Window 상태 변경해도 다른 Window에 영향 x
// Scene의 수명 주기: 실행중인 플랫폼에서 담당
// View가 Scene을 구성하고(content) -> App 구성
