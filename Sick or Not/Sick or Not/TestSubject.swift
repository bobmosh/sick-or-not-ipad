//
//  TestSubject.swift
//  Sick or Not
//
//  Created by Ferdinand Goeldner on 21.03.20.
//  Copyright © 2020 Ferdinand Goeldner. All rights reserved.
//

import Foundation
import SwiftUI

enum TestStatus: String, CaseIterable {
    case Undefined
    case Untested
    case Pending
    case Positive
    case Negative
}

class TestSubject: Identifiable {
    public let id = UUID()
    public var subjectName: String
    public var adress: String
    public var testStatus: TestStatus
    public var statusColor: Color {
        switch testStatus {
        case .Negative:
            return Color.green
        case .Positive:
            return Color.red
        case .Pending:
            return Color.secondary
        default:
            return Color.black
        }
    }

    init(subjectName: String,
         adress: String,
         testStatus: TestStatus) {
        self.subjectName = subjectName
        self.adress = adress
        self.testStatus = testStatus
    }
}
