//
//  Diary.swift
//  naemem
//
//  Created by 백록담 on 4/16/24.
//
import Foundation
import SwiftData

@Model
final class Diary {
    
    @Attribute(.unique) var id: UUID = UUID()
    var title: String // 제목
    var thumbnail: Data
    var imageCnt: Int //이미지수
    var created: String // 포스트작성일
    var isDeleted: Bool

    @Relationship(inverse: \PostImage.diary) var postImages: [PostImage]?
//    var postImages: [PostImage]? = []
    
    init(title: String, thumbnail:Data, imageCnt:Int, created: String) {
        self.title = title
        self.thumbnail = thumbnail
        self.imageCnt = imageCnt
        self.created = created
        self.isDeleted = false
    }
}
