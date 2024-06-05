//
//  PhotoPicker.swift
//  naemem
//
//  Created by 백록담 on 4/15/24.
//

import SwiftUI
import PhotosUI

// 새로운 PhotoData 구조체 정의
struct PhotoData {
    var id: UUID
    var image: UIImage
    var date: String
    var location: String
}

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    @Binding var showPicker: Bool
    @Binding var imagesSelected: Bool  // 이미지 선택 완료 상태를 알리는 새로운 변수

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0 // 0은 무제한 선택을 의미합니다.
        config.filter = .images // 이미지만 선택하도록 설정

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            if !results.isEmpty {
                self.parent.imagesSelected = true  // 이미지 선택이 완료되었음을 알립니다.
            }

            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    if let image = object as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.selectedImages.append(image)
                        }
                    }
                }
            }
        }
    }
}
