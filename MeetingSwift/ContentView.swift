//
//  ContentView.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/23/20.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @ObservedObject var container: MeetingContainer
    @State private var show: Bool = false
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    HStack {
                        Spacer()
                        Button(action: {
                            show.toggle()
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add")
                            }
                        }.sheet(isPresented: $show) {
                            Text("Add new meeting here")
                        }
                        Spacer()
                    }
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
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Meetings")
            }
            
            VStack {
                VideoPlayer(player: AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")!))
            }
            .tabItem {
                Image(systemName: "video")
                Text("Video")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(meetings: testData)
            .preferredColorScheme(.dark)
    }
}
