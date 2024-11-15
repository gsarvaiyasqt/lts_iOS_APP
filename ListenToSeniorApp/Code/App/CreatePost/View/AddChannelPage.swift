//
//  AddChannel.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 07/11/24.
//

import SwiftUI

struct AddChannel: View {
    
    @State private var channelName : String = ""
    @State private var isShowPickerSelector : Bool = false
    
    @State private var avatarImage : UIImage?
    @State private var bannerImage : UIImage?
    
    @State private var sourceType : SourceType = .camera
    @State private var imagePickerPresented = false
    
    @State private var isAvatar = false
    
    var body: some View {
        ZStack(alignment: .top){
            Color.black.ignoresSafeArea()
            
            VStack{
                
                Button(action: {
                    isAvatar = true
                    isShowPickerSelector.toggle()
                }, label: {
                    ZStack {
                        if avatarImage == nil {
                            Color.clear
                                .frame(width: 120,height: 120)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(Color.orange, lineWidth: 2)
                                }

                                
                        }else{
                            Image(uiImage: avatarImage ?? UIImage(resource: .img2))
                                .resizable()
                                .frame(width: 120,height: 120)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(Color.orange, lineWidth: 2)
                                }
                        }
                        
                        if avatarImage == nil{
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width:28, height: 22)
                                .foregroundColor(.gray)
                                
                        }
                        
                    }
                    .padding(.bottom ,10)
                })
                .confirmationDialog("Select Picker", isPresented: $isShowPickerSelector, actions: {
                    
                    Button("Photo"){
                        sourceType = .photo
                        imagePickerPresented = true
                    }
                    
                    Button("Camera"){
                        sourceType = .camera
                        imagePickerPresented = true
                    }
                    
  
                })
                .sheet(isPresented: $imagePickerPresented, content: {
                    if sourceType == .camera {
                        accessCameraView(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                    }else {
                        PhotoLibraryPicker(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                    }
                })
                
                
                Button(action: {
                    isAvatar = false
                    isShowPickerSelector.toggle()
                }, label: {
                    ZStack {
                        if bannerImage == nil {
                            Color.clear
                                .frame(width: 280,height: 130)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(Color.orange, lineWidth: 2)
                                }

                                
                        }else{
                            Image(uiImage: bannerImage ?? UIImage(resource: .img2))
                                .resizable()
                                .frame(width: 280,height: 130)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                                .overlay {
                                    RoundedRectangle(cornerRadius: 15)
                                        .strokeBorder(Color.orange, lineWidth: 2)
                                }
                        }
                        
                        if bannerImage == nil{
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width:28, height: 22)
                                .foregroundColor(.gray)
                                
                        }
                        
                    }
                    .padding(.bottom ,10)
                })
                .confirmationDialog("Select Picker", isPresented: $isShowPickerSelector, actions: {
                    
                    Button("Photo"){
                        sourceType = .photo
                        imagePickerPresented = true
                    }
                    
                    Button("Camera"){
                        sourceType = .camera
                        imagePickerPresented = true
                    }
                    
  
                })
                .sheet(isPresented: $imagePickerPresented, content: {
                
                    if sourceType == .camera {
                        accessCameraView(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                        
                        
                    }else {
                        PhotoLibraryPicker(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                    }
                })
                

                CustomTextField(txtController: $channelName,
                                hintText: .constant("Your Channel Name"),
                                headerText: .constant("Your Channel Name"))
                
                Spacer()
                
                
                HStack {
                    CustomButton(btnTxt: "Cancel",OnTap: {},isLoding: .constant(false))
                
                    
                    
                    CustomButton(btnTxt: "Cancel",OnTap: {},isLoding: .constant(false)) 
                }
                .safeAreaInset(edge: .bottom, content: {
                    Color.clear.frame(height: 20)
                })
            }
            .padding(.horizontal, 10)
            .ignoresSafeArea(edges: .bottom)
        }
            
    }
}

#Preview {
    AddChannel()
}
