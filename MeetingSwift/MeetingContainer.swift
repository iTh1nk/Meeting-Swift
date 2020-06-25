//
//  MeetingContainer.swift
//  MeetingSwift
//
//  Created by Chao Feng on 6/25/20.
//

import Foundation

class MeetingContainer: ObservableObject {
    @Published var meetings: [Meeting]
    
    init(meetings: [Meeting] = []) {
        self.meetings = meetings
    }
}

let testContainer = MeetingContainer(meetings: testData)
