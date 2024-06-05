//
//  TabView.swift
//  naemem
//
//  Created by 백록담 on 4/12/24.
//

import Foundation
import SwiftUI

struct TabContentView: View {
    
    @State private var showMainView = false
    
    var body: some View {
        ZStack {
            if showMainView {
                // 메인 콘텐츠나 이후의 뷰들을 여기에 작성합니다.
                TabView{
                    ActivityView()
                        .tabItem {
                            Image(systemName: "rosette")
                            Text("활동")
                                .padding(10)
                        }
                    
                    PostView()
                        .tabItem {
                            Image(systemName: "newspaper")
                            Text("내 글 보기")
                                .padding(10)
                        }
                }
                .font(.headline)
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
    
}

#Preview {
    TabContentView()
}
