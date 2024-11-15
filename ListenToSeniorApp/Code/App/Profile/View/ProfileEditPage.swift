//
//  ProfileEditPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 05/11/24.
//

import SwiftUI

struct ProfileEditPage: View {
    
    @State private var avatarImage : UIImage?
    @State private var bannerImage : UIImage?
    
    @State private var isShowProfileSelector = false
    @State private var isAvatar = false
    
    
    @State private var imagePickerPresented = false
    
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var email : String = ""
    @State private var address : String = ""
    @State private var zipCode : String = ""
    @State private var city : String = ""
    @State private var state : String = ""
    @State private var country : String = ""
    @State private var facebookProfile : String = ""
    @State private var twitterProfile : String = ""
    @State private var instaProfile : String = ""
    
    @State private var sourceType : SourceType = .camera
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                ProfileDetailsToolbar()
                
                ZStack(alignment: .topTrailing) {
                    
                    Button(action: {
                        isAvatar = false
                        isShowProfileSelector.toggle()
                    }, label: {
                        ZStack(alignment: .topTrailing) {
                            Image(uiImage: bannerImage ?? UIImage(resource: .img2))
                                .resizable()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(height: 120)
                            
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width:28, height: 22)
                                .foregroundColor(.white)
                                .padding()
                        }
                    })
                    
                    .confirmationDialog("Choose an Option", isPresented: $isShowProfileSelector, actions: {
                        Button("Camera"){
                            sourceType =  .camera
                            imagePickerPresented = true
                        }
                        
                        Button("Photos Gallery"){
                            sourceType =  .photo
                            imagePickerPresented = true
                        }
                    })
                    
                    .sheet(isPresented: $imagePickerPresented){
                        if sourceType == .camera {
                            accessCameraView(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                        }else {
                            PhotoLibraryPicker(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                        }
                    }
                    
                    
                   
                    VStack {
                        
                        Button(action: {
                            isAvatar = true
                            isShowProfileSelector.toggle()
                        }, label: {
                            ZStack {
                                if avatarImage == nil {
                                    Circle()
                                        .frame(width: 105,height: 105)
                                        .foregroundColor(.white)
                                        .padding(.top, 60)
                                }else{
                                    Image(uiImage: avatarImage ?? UIImage(resource: .img2))
                                        .resizable()
                                        .frame(width: 105,height: 105)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        .padding(.top, 60)
                                    
                                }
                                
                                if avatarImage == nil{
                                    Image(systemName: "camera")
                                        .resizable()
                                        .frame(width:28, height: 22)
                                        .foregroundColor(.black)
                                        .padding(.top, 50)
                                }
                                
                            }
                        })
                        
                        .confirmationDialog("Choose an Option", isPresented: $isShowProfileSelector, actions: {
                            Button("Camera"){
                                sourceType = .camera
                                imagePickerPresented = true
                            }
                            
                            Button("Photos Gallery"){
                                sourceType = .photo
                                imagePickerPresented = true
                            }
                        })
                        
                        .sheet(isPresented: $imagePickerPresented){
                            if sourceType == .camera {
                                accessCameraView(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                            }else{
                                PhotoLibraryPicker(selectedImage: isAvatar ? $avatarImage : $bannerImage)
                            }
                        }
                     
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                }
                    
                
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            CustomTextField(
                                txtController: $firstName,
                                hintText: .constant("FirstName"),
                                headerText: .constant("First Name"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                            
                            CustomTextField(
                                txtController: $lastName,
                                hintText: .constant(" LastName"),
                                headerText: .constant("Last Name"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                        }
                        
                    
                        
                        CustomTextField(
                            txtController: $email,
                            hintText: .constant("Email Address"),
                            headerText: .constant("Email Id"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        CustomTextField(
                            txtController: $address,
                            hintText: .constant("Your Address"),
                            headerText: .constant("Address"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        CustomTextField(
                            txtController: $zipCode,
                            hintText: .constant(" Zip Code"),
                            headerText: .constant("Zip Code"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        HStack {
                            CustomTextField(
                                txtController: $city,
                                hintText: .constant("City"),
                                headerText: .constant("City"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                            
                            CustomTextField(
                                txtController: $state,
                                hintText: .constant("State"),
                                headerText: .constant("State"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                        }
                        
                        
                        CustomTextField(
                            txtController: $country,
                            hintText: .constant("Country"),
                            headerText: .constant("Country"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        CustomTextField(
                            txtController: $instaProfile,
                            hintText: .constant("Instagram Profile"),
                            headerText: .constant("Instagram Profile"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        CustomTextField(
                            txtController: $country,
                            hintText: .constant("Facebook Profile"),
                            headerText: .constant("Facebook Profile"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        CustomTextField(
                            txtController: $country,
                            hintText: .constant("Twitter Profile"),
                            headerText: .constant("Twitter Profile"),
                            passwordIconView: AnyView(
                                Text("")
                            )
                        )
                        
                        HStack{
                            CustomButton(btnTxt: "Cancel", OnTap: {}, isLoding: .constant(false))
                            
                            
                            CustomButton(btnTxt: "Save", OnTap: {},isLoding: .constant(false))
                        }
                        
                    }
                    .padding(.horizontal,10)
                }
            }
        }
    }
}

#Preview {
    ProfileEditPage()
}
