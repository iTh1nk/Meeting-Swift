//
//  MeetingSwiftApp.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/23/20.
//

import SwiftUI

@main
struct MeetingSwiftApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(meetings: testData)
        }
    }
}
