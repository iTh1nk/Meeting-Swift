//
//  ContentView.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<6) { i in
                HStack {
                    Spacer()
                    VStack {
                        Text("Meeting \(i+1)")
                    }
                    Spacer()
                }
            }
            .navigationTitle("All Meetings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
