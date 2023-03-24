//
//  MemeCreatorApp.swift
//  MemeCreator
//
//  Created by Uchchhwas Roy on 24/3/23.
//

import SwiftUI

@main
struct MemeCreatorApp: App {

    @StateObject private var fetcher = PandaCollectionFetcher()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MemeCreator().environmentObject(fetcher)
            }
        }
    }
}
