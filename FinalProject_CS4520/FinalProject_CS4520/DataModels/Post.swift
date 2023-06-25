//
//  Post.swift
//  FinalProject_CS4520
//
//  Created by John Rodrigues on 6/23/23.
//
import Foundation
import FirebaseFirestoreSwift
import FirebaseFirestore

struct Post: Codable{
    @DocumentID var id: String?
    var username: String
    var dateTime: Timestamp
    var caption: String
    var location: String

    init(username: String, dateTime: Timestamp, caption: String, location: String) {
        self.username = username
        self.dateTime = dateTime
        self.caption = caption
        self.location = location
    }
}
