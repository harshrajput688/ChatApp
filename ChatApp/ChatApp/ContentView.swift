//
//  ContentView.swift
//  ChatApp
//
//  Created by Harsh Rajput on 01/05/25.
//

import SwiftUI

struct ContentView: View {
    var messageArray = ["Hello how are you", "I am fine", "Thank you", "You are welcome","how about your studies going on brother.","I am doing well","Thats great"]
    @StateObject var messageManager = MessageManager()
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                ScrollViewReader {proxy in
                    ScrollView{
                        ForEach(messageManager.messages, id: \.id){message in
                            let _ = print("timestemp : \(message.timestamp)")
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .onChange(of: messageManager.lastMessageId) { oldId, newId in
                        withAnimation {
                            proxy.scrollTo(newId, anchor: .bottom)
                        }
                    }
                }
                
                
            }
            .background(Color.peach)
            MessageField()
                .environmentObject(messageManager)
        }
    }
}

#Preview {
    ContentView()
}
