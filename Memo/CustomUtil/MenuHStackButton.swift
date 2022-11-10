//
//  MenuHStackButton.swift
//  Memo
//
//  Created by 김지은 on 2022/11/09.
//

import SwiftUI

struct MenuHStackButton: View {
    var body: some View {
        HStack {
            
            Button(action: {
                
            }, label: {
                VStack {
                    Image(systemName: "doc.viewfinder")
                    
                    Text("스캔")
                }
            })
            
            Button(action: {
                
            }, label: {
                VStack {
                    Image(systemName: "pin.fill")
                    
                    Text("고정")
                }
            })
            
            Button(action: {
                
            }, label: {
                VStack {
                    Image(systemName: "lock.fill")
                    
                    Text("잠그기")
                }
            })
        }
        .foregroundColor(.black)
    }
}

struct MenuHStackButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuHStackButton()
    }
}
