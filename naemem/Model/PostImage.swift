//
//  PostImage.swift
//  naemem
//
//  Created by 백록담 on 4/16/24.
//
import Foundation
import SwiftData

@Model
final class PostImage {
    @Attribute(.unique) var id: UUID = UUID()
    var data: Data //이미지 정보
    var content: String //사진내용
    var created: String
    var isDeleted: Bool
    
    var diary: Diary?
    
    init(data: Data, content: String, created: String) {
        self.data = data
        self.content = content
        self.created = created
        self.isDeleted = false
    }
}
