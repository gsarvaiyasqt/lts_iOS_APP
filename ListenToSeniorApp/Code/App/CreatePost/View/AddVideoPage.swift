//
//  AddVideoPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 07/11/24.
//

import SwiftUI
import AVKit

struct AddVideoPage: View {
    
    enum videoPickerEnum {
        case camera
        case media
        
    }
    
    @State private var videoUrl: URL?
    @State private var showVideoPicker: Bool = false
    @State private var isVideoPicker: Bool = false
    
    @State private var sourceType : videoPickerEnum = .camera
    
   
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                
                if let videoURL = videoUrl {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.orange, lineWidth: 2)
                        }
                        .padding(.bottom, 20)
                    
                }else{
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 28, height:  24)
                        .foregroundColor(.gray.opacity(0.8))
                        .padding(.horizontal,160)
                        .padding(.vertical,70)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 15)
                        )
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.orange, lineWidth: 2)
                        }
                        .padding(.bottom, 20)
                }
                
            
                
                Button(action: {
                    showVideoPicker = true
                }, label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 20,height: 24)
                            .foregroundColor(.white)
                            .padding(.trailing, 5)
                        
                        Text("Upload Video")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .bold()
                        
                    }
                })
                .buttonStyle(.bordered)
                .confirmationDialog("Select Media", isPresented: $showVideoPicker, actions: {
                    Button("Camera"){
                        sourceType = .camera
                        isVideoPicker = true
                    }
                    
                    Button("Media"){
                        sourceType = .media
                        isVideoPicker = true
                    }
                    
                })
                .sheet(isPresented: $isVideoPicker, content: {
                    if(sourceType == .media){
                        MediaLibraryPicker(selectedMedia: $videoUrl, selectedImage: .constant(nil))
                    }else{
                        accessVideoCameraView(selectedImage: .constant(nil), selectedVideoURL: $videoUrl)
                    }
              
                })
            
            }
           
        }
    }
}

#Preview {
    AddVideoPage()
}
