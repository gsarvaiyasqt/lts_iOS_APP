//
//  LoginResModel.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 13/11/24.
//

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel : Codable {
    let status, statusCode: Int?
    let message: String
    let data: LoginResponseData
}

// MARK: - DataClass
struct LoginResponseData: Codable {
    let token: String?
    let userid, memberid: Int?
    let username: String?
    let roleid: Int?
    let isactive, isdefault, isblock: Int?
    let displayname, associationtype: String?
    let associationid: Int?
    let createdon: String?
    let createdby: String?
    let updatedon: String?
    let updatedby, photo: String?
    let memberno: String?
    let currentpackageid, packageid: Int?
    let packagetype, packagename: String?
    let noOfView, noOfUploaded: Int?
    let viewFrequency, uploadFrequency, packageFrequency: String?
    let noOfSubscription: Int?
    let categorydata: [Categorydatum]
}


// MARK: - Categorydatum
struct Categorydatum: Codable {
    let categoryid: Int?
    let categoryname: String?
}

