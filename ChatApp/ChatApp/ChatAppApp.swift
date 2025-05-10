//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Harsh Rajput on 01/05/25.
//

import SwiftUI
import Firebase

@main
struct ChatAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//            TitleRow()
        }
    }
}
