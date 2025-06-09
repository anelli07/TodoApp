//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Anel Anuash on 04.06.2025.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    @StateObject private var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authService) // <- доступ к сессии во всём приложении

        }
    }
}
