//
//  Models.swift
//  instagram
//
//  Created by yushi kida on 2020/10/01.
//  Copyright © 2020 yushi kida. All rights reserved.
//

import Foundation

enum Gender {
    case male, female, other
}

struct User {
    let username: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: userCount
    let joinDate: Date
}

struct userCount {
    let followers: Int
    let following: Int
    let posts: Int
}

public enum UserPostType {
    case photo, video
}

public struct UserPost {
    let identifire: String
    let postType: UserPostType
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let commen: [PostComment]
    let createdDate: Date
    let taggedUsers: [String]
}

public struct PostLike {
    let username: String
    let postIdentifier: String
}

public struct CommentLike {
    let username: String
    let commentIdentifier: String
}

public struct PostComment {
    let identifier: String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLike]
}
