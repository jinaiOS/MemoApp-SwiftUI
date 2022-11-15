//
//  AddFolderView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/15.
//

import SwiftUI

struct AddFolderView: View {
    @Environment(\.presentationMode) var presentationMode // 화면 이동 설정
    @EnvironmentObject var modelData: ModelData
    
    @State var folderName: String = "새로운 폴더"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    TextField("새로운 폴더", text: $folderName)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)
                    
                    Button {
                        
                    } label: {
                        NavigationLink {
                            
                        } label: {
                            HStack() {
                                Image(systemName: "gearshape.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.yellow)
                                
                                VStack(alignment: .leading) {
                                    Text("스마트 폴더로 만들기")
                                        .font(.title3)
                                    
                                    Text("태그 및 기타 필터를 사용하여 정리")
                                        .font(.subheadline)
                                }
                                .foregroundColor(.black)
                            }
                                .frame(maxWidth: .infinity).padding()
                            // 최대한 늘려서 양 옆에 붙임
                                .frame(height: 70)
                                .background(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(14)
                .navigationBarTitle("새로운 폴더", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("완료") {
                            modelData.addFolder(folder: folderName)
                            dismiss()
                        }
                        .foregroundColor(.yellow)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("취소") {
                            dismiss()
                        }
                        .foregroundColor(.yellow)
                    }
                }
            }
            .background(Color(uiColor: .secondarySystemBackground))
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddFolderView_Previews: PreviewProvider {
    static var previews: some View {
        AddFolderView()
            .environmentObject(ModelData())
    }
}
