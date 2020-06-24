//
//  ContentView.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/23/20.
//

import SwiftUI

struct ContentView: View {
    
    var meetings: [Meeting] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(meetings) { meeting in
                    HStack {
                        Text("\(meeting.title)")
                            .font(.headline)
                        Spacer()
                        Text("\(meeting.timeStart)")
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("All Meetings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meetings: testData)
    }
}
