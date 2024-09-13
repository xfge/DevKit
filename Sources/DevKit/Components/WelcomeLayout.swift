//
//  WelcomeLayout.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/9/13.
//

import SwiftUI

public struct WelcomeLayout<Content: View, Action: View>: View {
    var title: String

    var content: () -> Content
    @ViewBuilder var action: () -> Action

    public init(title: String, content: @escaping () -> Content, @ViewBuilder action: @escaping () -> Action) {
        self.title = title
        self.content = content
        self.action = action
    }

    public var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                Text(title)
                    .font(.largeTitle.bold())
                    .padding(.top, 64)
                    .padding(.bottom, 32)
                    .padding(.horizontal)

                content()
                    .padding([.horizontal, .bottom])
            }
            VStack {
                action()
                Spacer()
            }
            .frame(height: 108)
        }
        .padding()
        .if(UIDevice.isIPad) { view in
            view.padding(.horizontal, 80)
        }
    }
}

#Preview {
    WelcomeLayout(title: "") {
        Text("")
    } action: {
    }
}
