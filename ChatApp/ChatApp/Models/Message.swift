//
//  Message.swift
//  ChatApp
//
//  Created by Harsh Rajput on 08/05/25.
//

import Foundation
struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
