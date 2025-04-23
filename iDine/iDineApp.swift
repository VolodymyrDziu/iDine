//
//  iDineApp.swift
//  iDine
//
//  Created by Volodymyr Dziubenko on 09.04.2025.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
           MainView()
                .environmentObject(order)
        }
    }
}
