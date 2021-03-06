//
//  CreateMeeting.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/25/20.
//

import SwiftUI

struct CreateMeeting: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var alertAdd: Bool = false
    @ObservedObject var container: MeetingContainer
    
    @ObservedObject var spState = SpState()
    @State private var testModal: Bool = false
    
    @State var title: String = ""
    @State var timeStart: String = ""
    @State var timeEnd: String = ""
    @State var location: String = ""
    @State var hosts: String = ""
    @State var attendees: String = ""
    @State var howEmergency: Int = 1
    @State var avatar: String = "meeting"
    @State private var locationIndex = 0
    var locationOptions: Array = ["101", "105", "203"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("title")) {
                    TextField("Meeting Title", text: $title)
                }
                
                Section(header: Text("time")) {
                    TextField("Meeting Start At", text: $timeStart)
                    TextField("Meeting End At", text: $timeEnd)
                }
                
                Section(header: Text("location")) {
                    Picker(selection: $locationIndex, label: Text("Pick Locaton")) {
                        ForEach(0 ..< locationOptions.count) {
                            Text(self.locationOptions[$0])
                        }
                    }
                }
                Section(header: Text("Hosts")) {
                    TextField("Names of Hosts", text: $hosts)
                }
                Section(header: Text("Attendees")) {
                    TextField("Names of Attendees", text: $attendees)
                }
                Section {
                    Button(action: {
                        resetField()
                    }) {
                        Text("Reset All Fields")
                    }
                }
                Section {
                    Button(action: {
                        alertAdd.toggle()
                        newMeeting()
                        resetField()
                    }) {
                        Text("Add New Meeting")
                    }
                    .alert(isPresented: $alertAdd) {
                        Alert(title: Text("Meeting Added"), message: Text("Check all meetings on home page."), dismissButton: .default(Text("Dissmis")))
                    }
                }
            }
            .navigationBarTitle("New Meeting")
        }
        .environment(\.colorScheme, colorScheme == .dark ? .dark : .light)
    }
    
    func newMeeting() {
        withAnimation {
            container.meetings.append(Meeting(title: title, timeStart: timeStart, timeEnd: timeEnd, location: locationOptions[locationIndex], hosts: hosts, attendees: attendees, howEmerge: 5, avatar: "meeting4"))
        }
    }
    func resetField() {
        title = ""
        timeStart = ""
        timeEnd = ""
        location = ""
        hosts = ""
        attendees = ""
        howEmergency = 1
        avatar = "meeting"
    }
    
}

struct CreateMeeting_Previews: PreviewProvider {
    static var previews: some View {
        CreateMeeting(container: testContainer)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
        
    }
}
