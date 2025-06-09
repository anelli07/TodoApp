//
//  ContentView.swift
//  Todo App
//
//  Created by Anel Anuash on 04.06.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: AuthService

    var body: some View {
        if authService.user != nil {
            TabBarView()
        } else {
            AuthView()
        }
    }
}
