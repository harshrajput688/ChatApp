//
//  TitleRow.swift
//  ChatApp
//
//  Created by Harsh Rajput on 05/05/25.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://unsplash.com/photos/woman-taking-photo-while-showing-smile-u3WmDyKGsrY")
    var name = "Sarah Smith"
    var body: some View {
        HStack(spacing: 20){
            AsyncImage(url: imageUrl){image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title)
                    .bold()
                Text("Online")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "phone.fill")
                .foregroundStyle(.gray)
                .padding(10)
                .background(.white)
                .clipShape(.circle)
        }
        .padding()
    }
}

#Preview {
    TitleRow()
        .background(Color("Peach"))
}
