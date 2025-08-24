//
//  WelcomeGroupView.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2025/4/29.
//

import SwiftUI

public struct WelcomeGroupView<Header: View, Content: View, Bottom: View>: View {
    var title: String?
    var caption: String?
    var prompt: String?
    var cornerRadius: Double = 8

    var header: () -> Header
    @ViewBuilder var content: () -> Content
    @ViewBuilder var bottom: () -> Bottom

    public init(title: String? = nil,
                caption: String? = nil,
                prompt: String? = nil,
                cornerRadius: Double = 8,
                header: @escaping () -> Header,
                @ViewBuilder content: @escaping () -> Content,
                @ViewBuilder bottom: @escaping () -> Bottom) {
        self.title = title
        self.caption = caption
        self.prompt = prompt
        self.header = header
        self.cornerRadius = cornerRadius
        self.content = content
        self.bottom = bottom
    }

    @ScaledMetric var gap: CGFloat = 32

    public var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: gap) {
                    headerView
                        .padding(.horizontal, 8)
                    promptBox
                    content()
                }
            }
            .padding(.bottom)

            VStack {
                bottom()
                Spacer()
            }
            .frame(height: 108)
        }
        .padding()
        .if(UIDevice.isIPad) { view in
            view.padding(.horizontal, 80)
        }
    }

    var headerView: some View {
        VStack(spacing: 16) {
            header()
            if let title {
                Text(title)
                    .multilineTextAlignment(.center)
                    .font(.title.bold())
            }
            if let caption {
                Text(caption)
                    .multilineTextAlignment(.center)
            }
        }
    }

    @ViewBuilder
    var promptBox: some View {
        if let prompt {
            HStack(alignment: .top) {
                Image(systemSymbol: .infoCircle)
                Text(prompt)
                    .font(.footnote)
                Spacer(minLength: 0)
            }
            .foregroundStyle(.secondary)
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(Color(uiColor: UIColor { $0.userInterfaceStyle == .dark ? .systemGray5 : .systemBackground }))
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .contentShape(.contextMenuPreview, RoundedRectangle(cornerRadius: cornerRadius))
            .padding(0.5)
        }
    }
}
