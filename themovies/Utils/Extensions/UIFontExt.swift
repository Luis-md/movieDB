//
//  UIFontExt.swift
//  themovies
//
//  Created by Luis Domingues on 01/05/23.
//

import UIKit

extension UIFont {

    public enum InterType: String {
        case light = "-Light"
        case regular = "-Regular"
        case semiBold = "-SemiBold"
        case bold = "-Bold"
    }

    static func Inter(_ type: InterType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Inter\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}
