//
//  UILabel+Styling.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import UIKit

extension UILabel: Stylable {

    enum UIStyle  {
        case body
        case footnote
        case title2
        case subheadline
    }

    typealias Style = UILabel.UIStyle

    @discardableResult
    func applyStyle(_ style: Style) -> Self {
        switch style {
        case .body:
            textColor = .primaryLabel
            font = .boldBodyFont
        case .footnote:
            textColor = .secondaryLabel
            font = .regularFootnoteFont
            numberOfLines = 2
        case .title2:
            textColor = .primaryLabel
            font = .boldTitle2Font
            textAlignment = .center
        case .subheadline:
            textColor = .secondaryLabel
            font = .regularSubheadlineFont
            textAlignment = .center
        }
        return self
    }
}
