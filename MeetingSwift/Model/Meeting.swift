//
//  Meeting.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/24/20.
//

import Foundation

struct Meeting: Identifiable {
    var id = UUID()
    var title: String
    var timeStart: String
    var timeEnd: String
    var location: String
    var hosts: String
    var attendees: String
    var howEmerge: Int
    var avatar: String
}

let testData = [
    Meeting(title: "NextUp", timeStart: "07-01-2020", timeEnd: "07-02-2020", location: "Office 102", hosts: "Mac", attendees: "Mac, Wendy", howEmerge: 5, avatar: "meeting1"),
    Meeting(title: "RoundTwo", timeStart: "07-05-2020", timeEnd: "07-07-2020", location: "Office 101", hosts: "Wendy", attendees: "April, Wendy", howEmerge: 3, avatar: "meeting2"),
    Meeting(title: "EndGame", timeStart: "07-09-2020", timeEnd: "07-10-2020", location: "Office 203", hosts: "April", attendees: "Mac, Wendy, April", howEmerge: 2, avatar: "meeting3"),
]

class SpState: ObservableObject {
    @Published var modalAddShow = false
}
