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
                    NavigationLink(destination: MeetingDetails(meetings: meeting)) {
                        HStack {
                            Image("\(meeting.avatar)")
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text("\(meeting.title)")
                                .font(.headline)
                            Text("(\(meeting.timeStart))")
                                .font(.caption2)
                            Spacer()
                            Text("\(meeting.location)")
                                .font(.caption)
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 5)
                    }
                }
            }
            .padding(.top, 20)
            .navigationTitle("All Meetings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meetings: testData)
            .preferredColorScheme(.dark)
    }
}
