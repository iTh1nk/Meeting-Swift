//
//  MeetingDetails.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/24/20.
//

import SwiftUI

struct MeetingDetails: View {
    
    var meetings: Meeting
    
    var body: some View {
        VStack {
            HStack {
                Image("\(meetings.avatar)")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(.all, 30)
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Start At: ")
                            .font(.headline)
                        Text("\(meetings.timeStart)")
                    }
                    .padding(.all, 5)
                    HStack {
                        Text("End At: ")
                            .font(.headline)
                        Text("\(meetings.timeEnd)")
                    }
                    .padding(.all, 5)
                    HStack {
                        Text("Location: ")
                            .font(.headline)
                        Text("\(meetings.location)")
                    }
                    .padding(.all, 5)
                    HStack {
                        Text("Hosts: ")
                            .font(.headline)
                        Text("\(meetings.hosts)")
                    }
                    .padding(.all, 5)
                    HStack {
                        Text("Attendees: ")
                            .font(.headline)
                        Text("\(meetings.attendees)")
                    }
                    .padding(.all, 5)
                }
                Spacer()
            }
            .padding(.leading, 20)
            .navigationTitle(Text(meetings.title))
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct MeetingDetails_Previews: PreviewProvider {
    static var previews: some View {
        MeetingDetails(meetings: testData[0])
    }
}
