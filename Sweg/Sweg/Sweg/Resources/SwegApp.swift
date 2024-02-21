//
//  SwegApp.swift
//  Sweg
//
//  Created by Sanghyeon Park on 2/20/24.
//

import SwiftUI

@main
struct SwegApp: App {
    @StateObject var board = BoardModel.init(content: String(), title: String(), date: Date(), hits: Int())
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(board)
        }
    }
}
