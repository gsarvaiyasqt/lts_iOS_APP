//
//  CustomImagePicker.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 05/11/24.
//

import Foundation
import SwiftUI
import PhotosUI


enum SourceType {
    case camera
    case photo
}

struct accessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    init(selectedImage: Binding<UIImage?>) {
        _selectedImage = selectedImage
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}


struct accessVideoCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage? // For photos
    @Binding var selectedVideoURL: URL? // For videos
    @Environment(\.presentationMode) var isPresented

    init(selectedImage: Binding<UIImage?>, selectedVideoURL: Binding<URL?>) {
        _selectedImage = selectedImage
        _selectedVideoURL = selectedVideoURL
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.mediaTypes = ["public.image", "public.movie"] // Enable both photos and videos
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(picker: self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var picker: accessVideoCameraView

        init(picker: accessVideoCameraView) {
            self.picker = picker
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let mediaType = info[.mediaType] as? String {
                if mediaType == "public.image", let selectedImage = info[.originalImage] as? UIImage {
                    self.picker.selectedImage = selectedImage
                    self.picker.selectedVideoURL = nil // Clear video if an image is selected
                } else if mediaType == "public.movie", let videoURL = info[.mediaURL] as? URL {
                    self.picker.selectedVideoURL = videoURL
                    self.picker.selectedImage = nil // Clear image if a video is selected
                }
            }
            self.picker.isPresented.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.picker.isPresented.wrappedValue.dismiss()
        }
    }
}



//=========== photoLibrary


struct PhotoLibraryPicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.sourceType = .photoLibrary
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: PhotoLibraryPicker

        init(_ parent: PhotoLibraryPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = selectedImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


//=============== Media Picker


struct MediaLibraryPicker: UIViewControllerRepresentable {
    @Binding var selectedMedia: URL? // For video, use URL. UIImage for photo.
    @Binding var selectedImage: UIImage? // For photos.
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let mediaPicker = UIImagePickerController()
        mediaPicker.delegate = context.coordinator
        mediaPicker.sourceType = .photoLibrary
        mediaPicker.mediaTypes = ["public.image", "public.movie"] // Allow both photos and videos.
        return mediaPicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: MediaLibraryPicker

        init(_ parent: MediaLibraryPicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let mediaType = info[.mediaType] as? String {
                if mediaType == "public.image", let selectedImage = info[.originalImage] as? UIImage {
                    parent.selectedImage = selectedImage
                    parent.selectedMedia = nil // Clear video URL if an image is selected.
                } else if mediaType == "public.movie", let mediaURL = info[.mediaURL] as? URL {
                    parent.selectedMedia = mediaURL
                    parent.selectedImage = nil // Clear image if a video is selected.
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

