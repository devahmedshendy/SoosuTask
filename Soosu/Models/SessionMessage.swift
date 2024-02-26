//
//  SessionMessage.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import Foundation

struct SessionMessage: Identifiable, Hashable {
    let id: UUID = .init()
    let isRecipient: Bool
    let content: String
}

extension SessionMessage {
    static var samples: [SessionMessage] {
        [
            .init(
                isRecipient: true,
                content: """
                Hello, Sandy. I'm glad we can spend some time together today. How are you feeling at this moment?
                """
            ),
            .init(
                isRecipient: false,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ),
            .init(
                isRecipient: true,
                content: """
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                """
            ),
            .init(
                isRecipient: false,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ),
            .init(
                isRecipient: true,
                content: """
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                """
            ),
            .init(
                isRecipient: false,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ),
            .init(
                isRecipient: true,
                content: """
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                """
            ),
            .init(
                isRecipient: false,
                content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            ),
            .init(
                isRecipient: true,
                content: """
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
                """
            ),
        ]
    }
}
