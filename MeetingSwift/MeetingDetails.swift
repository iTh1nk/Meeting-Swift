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
        ScrollView {
            VStack {
                HStack {
                    Image("\(meetings.avatar)")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .frame(maxWidth: .infinity)
                .padding(.all, 30)
                
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Start At: ")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            Text("\(meetings.timeStart)")
                                .foregroundColor(.gray)
                        }
                        .padding(.all, 5)
                        HStack {
                            Text("End At: ")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            Text("\(meetings.timeEnd)")
                                .foregroundColor(.gray)
                        }
                        .padding(.all, 5)
                        HStack {
                            Text("Location: ")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            Text("\(meetings.location)")
                                .foregroundColor(.gray)
                        }
                        .padding(.all, 5)
                        HStack {
                            Text("Hosts: ")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            Text("\(meetings.hosts)")
                                .foregroundColor(.gray)
                        }
                        .padding(.all, 5)
                        HStack {
                            Text("Attendees: ")
                                .font(.system(size: 20))
                                .foregroundColor(.green)
                            Text("\(meetings.attendees)")
                                .foregroundColor(.gray)
                        }
                        .padding(.all, 5)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                .navigationTitle(Text(meetings.title))
                .toolbar {
                    EditButton()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MeetingDetails_Previews: PreviewProvider {
    static var previews: some View {
        MeetingDetails(meetings: testData[0])
            .preferredColorScheme(.dark)
    }
}
