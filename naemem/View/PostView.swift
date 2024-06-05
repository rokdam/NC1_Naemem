//
//  PostView.swift
//  naemem
//
//  Created by 백록담 on 4/12/24.
//

import Foundation
import SwiftUI
import SwiftData

struct PostView: View {
    
    @Query var diaries: [Diary]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    if diaries.isEmpty {
                        Spacer()
                        Text("작성된 글이 없습니다.")
                            .foregroundColor(.gray)
                        Spacer()
                    } else {
                        ForEach(diaries, id: \.self) { diary in
                            if let thumbnail = UIImage(data: diary.thumbnail) {
                                NavigationLink(destination: PostDetailView(diary: diary)) {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 300, height: 400)
                                            .background(
                                                Image(uiImage: thumbnail)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 300, height: 400)
                                                    .clipped()
                                            )
                                            .cornerRadius(20)
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                            .padding()
                                        
                                        HStack {
                                            Spacer()
                                            VStack(alignment: .leading) {
                                                Spacer()
                                                Text("\(diary.title)")
                                                    .foregroundColor(.white)
                                                    .font(.title)
                                                    .bold()
                                                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                                Text("\(diary.created)")
                                                    .foregroundColor(.white)
                                                    .font(.title3)
                                                    .bold()
                                                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                                                    .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                                
                                                Spacer()
                                                Spacer()
                                                Spacer()
                                            }
                                            Spacer()
                                            Spacer()
                                        }
                                    }
                                }
                            } else {
                                Text("Unable to load image")
                            }
                        }
                    }
                }
            }
            .navigationTitle("내 글 보기")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: CreatePostView()) {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.accentColor)
            })
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Diary.self, configurations: config)
    
//    let diary = Diary(title: "Sample Title",
//                        thumbnail: Data(), // 썸네일 이미지 데이터
//                        imageCnt: 3, // 이미지 개수
//                        created: "2024-06-05" // 포스트 작성일
//    )
    return PostView()
        .modelContainer(for: Diary.self)
}
