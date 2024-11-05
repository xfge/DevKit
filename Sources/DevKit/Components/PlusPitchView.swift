//
//  PlusPitchView.swift
//  DevKit
//
//  Created by Xiaofei Ge on 2024/11/5.
//

import SwiftUI

public struct PlusPitchView: View {
    var isUnlocked: Bool
    
    var plusText: String
    var unlockText: String
    var unlockedText: String
    var imageBundleName: String?
    
    var promoText: String?
    var promoColor: Color?
    
    public init(isUnlocked: Bool, plusText: String, unlockText: String, unlockedText: String, imageBundleName: String? = nil, promoText: String? = nil, promoColor: Color? = nil) {
        self.isUnlocked = isUnlocked
        self.plusText = plusText
        self.unlockText = unlockText
        self.unlockedText = unlockedText
        self.imageBundleName = imageBundleName
        self.promoText = promoText
        self.promoColor = promoColor
    }

    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                titleText
                if isUnlocked {
                    statusText
                } else {
                    upgradeButton
                        .padding(.top, 6)
                }
            }
            .padding(.vertical, 24)
            Spacer()
            if let imageBundleName {
                Image(imageBundleName)
                    .resizable()
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.horizontal, 24)
        .background {
            PremiumBackground()
        }
        .cornerRadius(15)
        .overlay(alignment: .topTrailing) {
            if let promoText {
                promotionTag(promoText, color: promoColor ?? .accentColor)
            }
        }
    }

    var titleText: some View {
        Text("Rond PLUS")
            .font(.system(.title3, weight: .semibold))
            .foregroundColor(.primary)
    }

    func promotionTag(_ label: String, color: Color) -> some View {
        Text(label)
            .textCase(.uppercase)
            .font(.footnote.bold())
            .foregroundStyle(.white)
            .padding(4)
            .padding(.horizontal, 4)
            .background(color)
            .clipShape(.rect(cornerRadius: 8))
    }

    var upgradeButton: some View {
        Text(unlockText)
            .roundedButton()
            .foregroundColor(.white)
    }

    var statusText: some View {
        Text(unlockedText)
            .font(.callout)
            .foregroundColor(.secondary)
    }
}
