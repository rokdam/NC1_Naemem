//
//  ContentDetailView.swift
//  naemem
//
//  Created by 백록담 on 4/15/24.
//

import Foundation
import SwiftUI

struct PostDetailView: View{
    
    var diary: Diary
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(diary.postImages!, id: \.self) { image in
                    if let img = UIImage(data: image.data) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 400)
                            .background(
                                Image(uiImage: img)
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 400)
                                    .clipped()
                            )
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .padding()
                    }
                }
            }
        }
        
        .navigationBarTitle(diary.title, displayMode: .inline)
    }
}


