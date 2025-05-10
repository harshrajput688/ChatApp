//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Harsh Rajput on 08/05/25.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Peach"))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        
        .padding(message.received ? .leading : .trailing)
//        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: "1234", text: "Fuck you asshole. don't wanted to tak about anything to you", received: false, timestamp: Date()))
}
