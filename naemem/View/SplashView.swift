//
//  SplashView.swift
//  naemem
//
//  Created by 백록담 on 4/17/24.
//

import Foundation
import SwiftUI

struct SplashView: View{
    
    var body: some View {
        ZStack {
            Color.accentColor
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                Text("NAE")
                    .font(
                        Font.custom("YClover-Bold", size: 59)
                            .weight(.semibold)
                    )
                Text("MEM")
                    .font(
                        Font.custom("YClover-Bold", size: 54)
                            .weight(.semibold)
                    )
                
                Text("줐")
                    .font(
                        Font.custom("YClover-Bold", size: 54)
                            .weight(.semibold)
                    )
            })
        }.ignoresSafeArea()
        
    }
}

#Preview {
    SplashView()
}
