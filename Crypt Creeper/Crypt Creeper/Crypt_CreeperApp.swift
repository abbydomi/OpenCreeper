//
//  Crypt_CreeperApp.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/1/23.
//

import SwiftUI

@main
struct Crypt_CreeperApp: App {
    @StateObject var router = Router()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(router)
        }
    }
}
