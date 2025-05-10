//
//  MessageManager.swift
//  ChatApp
//
//  Created by Harsh Rajput on 10/05/25.
//

import Foundation
import FirebaseFirestore

class MessageManager: ObservableObject{
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let document = querySnapshot?.documents else {
                print("Error fetching documents: \(error.debugDescription)")
                return
            }
            
            self.messages = document.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Error in decoding the data into messages: \(error.localizedDescription)")
                    return nil
                }
            }
            self.messages.sort{$0.timestamp < $1.timestamp}
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }

    }
    
    func sendMessage(text: String){
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        } catch  {
            print("Error adding message to firestore: \(error.localizedDescription)")
        }
    }
}
