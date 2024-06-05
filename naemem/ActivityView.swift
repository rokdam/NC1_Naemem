//
//  ContentView.swift
//  naemem
//
//  Created by 백록담 on 4/11/24.
//

import SwiftUI
import SwiftData

struct ActivityView: View {
    
    @Query var diaries: [Diary]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        Spacer()
                        VStack(alignment:.leading) {
                            Text("사진:")
                                .font(
                                    Font.custom("SF Pro Display", size: 20)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.black)
                            
                            if diaries.isEmpty {
                                Text("0/5 ")
                                    .font(
                                        Font.custom("SF Pro Display", size: 20)
                                            .weight(.semibold)
                                    )
                            } else {
                                ForEach(diaries, id: \.self){ diary in
                                    if diary.created == today() {
                                        Text("\(diary.imageCnt)/5 ")
                                            .font(
                                                Font.custom("SF Pro Display", size: 20)
                                                    .weight(.semibold)
                                            )
                                            .foregroundColor(.accentColor)
                                    }
                                }
                            }
                            
                        }
                        Spacer()
                        Ring()
                        Spacer()
                    }
                }
                .frame(width: 322.47574, height: 227.56248)
                .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                .cornerRadius(25)
                .shadow(color: .gray, radius: 2, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.97, green: 0.97, blue: 0.97), lineWidth: 1)
                )
                .padding()
                Spacer()
            }.navigationTitle("활동")
        }
    }
}
