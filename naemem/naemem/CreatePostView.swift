//
//  CreatePostView.swift
//  naemem
//
//  Created by 백록담 on 4/15/24.
//

import Foundation
import SwiftUI
import PhotosUI
import CoreLocation
import SwiftData

struct CreatePostView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var savePostImages:[PostImage] = []
    @State var showPicker: Bool = false
    @State private var selectedImages: [UIImage] = []
    @State private var imagesSelected: Bool = false
    @State private var showingAlert: Bool = false
    @State private var isValidateAlert:Bool = false
    
    @State private var selectedImage: UIImage?
    @State private var isCameraPresented = false
    
    @State private var photoDate: Date?
    @State private var photoLocation: CLLocation?
    
    @State private var alertMessage: String = ""
    @State private var inputTag: String = ""
    @State private var isShowingAlert: Bool = false
    
    @State var tag:Int? = nil
    
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading, content: {
            VStack(alignment: .leading) {
                
                //타이틀 입력
                TextField(text: $title, prompt: Text("제목을 입력하세요")) {
                    Text("title")
                }
                .padding()
                
                if selectedImages.isEmpty {
                    HStack {
                        ZStack(alignment: .center) {
                            Button(action: {
                                self.showPicker = true
                            }, label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 150, height: 150)
                                    .scaledToFill()
                                    .foregroundColor(.accentColor)
                            })
                            VStack {
                                Image(systemName: "photo.badge.plus")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    Spacer()
                    
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            
                            //선택된 이미지 썸네일 생성
                            ForEach(selectedImages, id: \.self) { img in
                                ZStack {
                                    Image(uiImage: img)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .scaledToFill()
                                        .cornerRadius(30)
                                    
                                }
                            }.padding([.leading, .trailing], 20)
                            Button(action: {
                                self.showPicker = true
                                
                            }, label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(Color(red: 210/255, green: 210/255, blue: 210/255))
                                        .frame(width: 150, height: 150)
                                    Image(systemName: "plus")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 57, height: 57)
                                }
                            })
                        }
                    }
                }
                
            }
            .sheet(isPresented: $showPicker) { //modal
                PhotoPicker(selectedImages: self.$selectedImages, showPicker: self.$showPicker, imagesSelected: self.$imagesSelected)
            }
        })
        .padding()
        .navigationBarItems(trailing:
                                Button(action: {
            
            if title.isEmpty {
                isValidateAlert = true;
            } else {
                self.tag = 1
                
                //diary 저장
                let date:Date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                let today = dateFormatter.string(from: date)
                
                //image 저장
                let firstImage = selectedImages.first?.pngData()
                let diary = Diary(title: title, thumbnail: firstImage!, imageCnt: selectedImages.count, created: today)
                for image in selectedImages {
                    //todo tag, content 저장
                    let post = PostImage(data: image.pngData()!, content: "", created: today)
                    savePostImages.append(post)
                    //이전 페이지로 이동
                    presentationMode.wrappedValue.dismiss()
                }
                
                diary.postImages = savePostImages
                modelContext.insert(diary)
            }
        }, label: {
            Text("다음")
        })
        )
        .alert(isPresented: $isValidateAlert) {
            Alert(title: Text("제목은 필수영역입니다"))
        }
    }
}


#Preview {
    CreatePostView().modelContainer(for: Diary.self, inMemory: true)
}
