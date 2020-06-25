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
            //Tab 1
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
                        }
                        .sheet(isPresented: $show) {
//                            Button("Add", action: newMeeting)
                            CreateMeeting(container: testContainer)
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "pencil")
                            #if os(iOS)
                            EditButton()
                            #endif
                        }
                        Spacer()
                    }
                    ForEach(container.meetings) { meeting in
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
                            .padding(.all, 5)
                        }
                    }
                    .onMove(perform: moveMeetings)
                    .onDelete(perform: removeMeetings)
                }
                .padding(.top, 20)
                .navigationBarTitle("All Meetings")
                .toolbar {
                    #if os(iOS)
                    EditButton()
                    #endif
                }
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Meetings")
            }
            //Tab 2:
            VStack {
                VideoPlayer(player: AVPlayer(url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4")!))
            }
            .tabItem {
                Image(systemName: "video")
                Text("Video")
            }
        }
    }
    
    func newMeeting() {
        withAnimation {
            container.meetings.append(Meeting(title: "Appended", timeStart: "07-01-2020", timeEnd: "07-02-2020", location: "Office 102", hosts: "Mac", attendees: "Mac, Wendy", howEmerge: 5, avatar: "meeting1"))
        }
    }
    func moveMeetings(from: IndexSet, to: Int) {
        withAnimation {
            container.meetings.move(fromOffsets: from, toOffset: to)
        }
    }
    func removeMeetings(offsets: IndexSet) {
        withAnimation {
            container.meetings.remove(atOffsets: offsets)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: testContainer)
            .preferredColorScheme(.dark)
    }
}
