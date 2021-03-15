//
//  RandomUser+ResponseData.swift
//  RandomUserAPI
//
//  Created by Seokhyun Kim on 2021-03-14.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    //list row 에 사용
    var id = UUID()
    var name : Name
    var photo : Photo
    //Json Data의 Key값을 원하지 않는 경우
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl : URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return name.description
    }
}

struct Name: Codable, CustomStringConvertible {
    var title : String
    var first : String
    var last : String
    
    var description: String {
        return "[\(title)] \(last), \(first)"
    }
    
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Name(title: "Youtube", first: "Seokhyun", last: "Kim")
    }
}

struct Photo: Codable {
    var large : String
    var medium : String
    var thumbnail : String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/women/93.jpg", medium: "https://randomuser.me/api/portraits/women/93.jpg", thumbnail: "https://randomuser.me/api/portraits/women/93.jpg")
    }
}

struct Info : Codable {
    var seed : String
    var resultsCount : Int
    var page : Int
    var version : String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse: Codable, CustomStringConvertible  {
    var results:[RandomUser]
    var info: Info
    //Json Data의 Key값을 원하지 않는 경우
    private enum Coding: String, CodingKey {
        case result, info
    }
    var description: String {
        return "results.count: \(results.count) / info : \(info.seed)"
    }
}
