//
//  Ring.swift
//  naemem
//
//  Created by 백록담 on 4/17/24.
//

import Foundation
import SwiftUI
import SwiftData

extension Color {
    public static var outlineRed: Color {
        return Color(decimalRed: 34, green: 0, blue: 3)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 221, green: 31, blue: 59)
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 239, green: 54, blue: 128)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}

struct Ring: View {
    
    @State private var showGreenStroke = false
    @State private var showBlueStroke = false
    
    @State var show = false
    @Query var diaries: [Diary]
    
    let dailyImageCnt: Int = 5; //하루목표이미지수
    //    let todayImageCnt: Int = 5 - todayCnt()? 1
    
    //todo 바꾸기
    //    @State private var progress1: CGFloat = 0.7 // 퍼센테이지 (0.0 ~ 1.0)
    //    @State private var progress2: CGFloat = 0.4 // 퍼센테이지 (0.0 ~ 1.0)
    var colors: [Color] = [Color.darkRed, Color.lightRed]
    
    var body: some View {
        if diaries.isEmpty {
            Circle() // Green
                .trim(from: 0.99, to: 1)
                .stroke (style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin:
                        .round))
                .frame (width: 100, height: 100)
                .foregroundColor(Color(red: 0.618, green: 0.968, blue:
                                        -0.013))
                .rotationEffect(.degrees (90)) // Flips the strokeStart
                .rotation3DEffect (.degrees(180), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.easeIn(duration: 1), value: showGreenStroke)
                .shadow(color: .gray, radius: 2, x: 0, y: 4)
                .onAppear()
            {
                self.showGreenStroke = true
            }
        } else {
            ForEach(diaries, id: \.self){ diary in
                if diary.created == today() {
                    Circle() // Green
                        .trim(from: showGreenStroke ? CGFloat(5-diary.imageCnt) / CGFloat(dailyImageCnt) : 1, to: 1)
                        .stroke (style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin:
                                .round))
                        .frame (width: 100, height: 100)
                        .foregroundColor(Color(red: 0.618, green: 0.968, blue:
                                                -0.013))
                        .rotationEffect(.degrees (90)) // Flips the strokeStart
                        .rotation3DEffect (.degrees(180), axis: (x: 1, y: 0, z: 0))
                        .animation(Animation.easeIn(duration: 1), value: showGreenStroke)
                        .shadow(color: .gray, radius: 2, x: 0, y: 4)
                        .onAppear()
                    {
                        self.showGreenStroke = true
                    }
                }
                
            }
        }
    }
}
