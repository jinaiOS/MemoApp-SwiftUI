//
//  ListView.swift
//  Memo
//
//  Created by 김지은 on 2022/11/04.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var modelData : ModelData
    @State var memo: Memo
    
    @State private var selectedMore = ""
    
    var body: some View {
        List(modelData.memos) { memo in
            NavigationLink {
                DetailView(memo: memo)
            } label: {
                ListViewRow(memo: memo)
            }
        }
//        .navigationTitle(folderName)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Menu {
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            Text("갤러리로 보기")
                            
                            Image(systemName: "square.grid.2x2")
                        }
                    })
                    
                    Section {
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("메모 선택")
                                
                                Image(systemName: "checkmark.seal")
                            }
                        })
                        Menu {
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("기본값(편집일)")
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("편집일")
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("생성일")
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("제목")
                                }
                            })
                            
                            Section {
                                Button(action: {
                                    
                                }, label: {
                                    HStack {
                                        Text("최신 항목 순으로")
                                    }
                                })
                                Button(action: {
                                    
                                }, label: {
                                    HStack {
                                        Text("오래된 항목 순으로")
                                    }
                                })
                            }
                            
                        } label: {
                            HStack {
                                Text("다음으로 정렬")
                                
                                Image(systemName: "arrow.up.arrow.down")
                            }
                        }
                        
                        Menu {
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("기본값(켬)")
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("켬")
                                }
                            })
                            Button(action: {
                                
                            }, label: {
                                HStack {
                                    Text("끔")
                                }
                            })
                        } label: {
                            HStack {
                                Text("날짜별로 그룹화")
                                
                                Image(systemName: "calendar")
                            }
                        }
                        
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Text("첨부 파일 보기")
                                
                                Image(systemName: "paperclip")
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
