//
//  Photo.swift
//  Swift-Alamofire
//
//  Created by 김종희 on 2023/08/22.
//

import Foundation


struct Post: Codable, Identifiable, CustomStringConvertible {
    let userID, id: Int
    let title, body: String
    
    var description: String {
        return "[\(title), \(body)]"
    }

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
