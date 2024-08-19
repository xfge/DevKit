//
//  SentenceWithLinkView.swift
//
//
//  Created by Xiaofei Ge on 2024/8/19.
//

import SwiftUI

public struct SentenceWithLinkView: View {
    var sentence: String
    var linkWord: String
    var url: URL? = URL(string: UIApplication.openSettingsURLString)

    public var body: some View {
        Text(attributedString)
    }

    var attributedString: AttributedString {
        var attributedString = AttributedString(sentence)

        if let rangeOfLink = attributedString.range(of: linkWord) {
            attributedString[rangeOfLink].link = url
        }

        return attributedString
    }
}

#Preview {
    SentenceWithLinkView(sentence: "Change your permission authorization in Settings.", linkWord: "Settings")
}
