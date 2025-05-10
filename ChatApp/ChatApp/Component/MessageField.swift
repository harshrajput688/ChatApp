//
//  MessageField.swift
//  ChatApp
//
//  Created by Harsh Rajput on 09/05/25.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messageManager : MessageManager
    @State private var message: String = ""
    var body: some View {
        HStack{
            TextField("Enter your message", text: $message)
            
            Button {
                messageManager.sendMessage(text: message)
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .clipShape(Circle())
            }

        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .clipShape(RoundedRectangle(cornerRadius: 50))
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessageManager())
}

