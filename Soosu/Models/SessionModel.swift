//
//  SessionModel.swift
//  Soosu
//
//  Created by Ahmed Shendy on 27/02/2024.
//

import Foundation

struct SessionModel: Identifiable, Hashable {
    let id: UUID = .init()
    let title: String
    let date: String
}

extension SessionModel {
    static var samples: [SessionModel] {
        [
            .init(
                title: "Session 3",
                date: "February, 16th"
            ),
            .init(
                title: "Session 2",
                date: "February, 12th"
            ),
            .init(
                title: "Session 1",
                date: "February, 10th"
            ),
        ]
    }
}
