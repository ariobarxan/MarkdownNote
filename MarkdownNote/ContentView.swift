//
//  ContentView.swift
//  MarkdownNote
//
//  Created by Home on 15/5/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView()
            .buttonStyle(BorderlessButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

#Preview {
    ContentView()
}
