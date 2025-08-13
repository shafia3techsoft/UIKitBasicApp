//
//  Font.swift
//  UIKitBasicApp
//
//  Created by shafia on 12/08/2025.
//

import UIKit

extension UIFont {
    
//    <string>ComicNeue-BoldItalic.ttf</string>
//    <string>ComicNeue-Italic.ttf</string>
//    <string>ComicNeue-Bold.ttf</string>
//    <string>ComicNeue-Light.ttf</string>
//    <string>ComicNeue-LightItalic.ttf</string>
//    <string>ComicNeue-Regular.ttf</string>
    
    private enum CustomFont: String {
        case regular = "ComicNeue-Regular"
        case italic = "ComicNeue-Italic"
        case thin = "ComicNeue-Light"
        case thinItalic = "ComicNeue-LightItalic"
        case bold = "ComicNeue-Bold"
        case boldItalic = "ComicNeue-BoldItalic"
    }
    
    static func appFontRD(ofSize size: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        var font = UIFont(name: CustomFont.regular.rawValue, size: size)
        switch weight {
        case .ultraLight:
            font = UIFont(name: CustomFont.thin.rawValue, size: size)
        case .thin:
            font = UIFont(name: CustomFont.thin.rawValue, size: size)
        case .light:
            font = UIFont(name: CustomFont.thin.rawValue, size: size)
        case .regular:
            font = UIFont(name: CustomFont.regular.rawValue, size: size)
        case .medium:
            font = UIFont(name: CustomFont.thinItalic.rawValue, size: size)
        case .semibold:
            font = UIFont(name: CustomFont.italic.rawValue, size: size)
        case .bold:
            font = UIFont(name: CustomFont.bold.rawValue, size: size)
        case .heavy:
            font = UIFont(name: CustomFont.bold.rawValue, size: size)
        case .black:
            font = UIFont(name: CustomFont.bold.rawValue, size: size)
        default:
            font = UIFont(name: CustomFont.regular.rawValue, size: size)
        }
        guard let retValue = font else {
            return .systemFont(ofSize: size, weight: weight)
        }
        return retValue
    }
    
    static func boldAppFontRD(ofSize size: CGFloat) -> UIFont {
        return self.appFontRD(ofSize: size, weight: .bold)
    }
    
    static func italicAppFontRD(ofSize size: CGFloat) -> UIFont {
        guard let retValue = UIFont(name: CustomFont.italic.rawValue, size: size) else {
            return .italicSystemFont(ofSize: size)
        }
        return retValue
    }
}

class AppFont {
    
    static let shared = AppFont()
    
    public var headingSemibold: UIFont {
        return UIFont.appFontRD(ofSize: 32, weight: UIFont.Weight.semibold)
    }
    
    public var headingRegular: UIFont {
        return UIFont.appFontRD(ofSize: 32, weight: UIFont.Weight.regular)
    }
    
    public var headlineSemibold: UIFont {
        return UIFont.appFontRD(ofSize: 24, weight: UIFont.Weight.semibold)
    }
    
    public var headlineRegular: UIFont {
        return UIFont.appFontRD(ofSize: 24, weight: UIFont.Weight.regular)
    }
    
    public var titleSemibold: UIFont {
        return UIFont.appFontRD(ofSize: 20, weight: UIFont.Weight.semibold)
    }
    
    public var titleRegular: UIFont {
        return UIFont.appFontRD(ofSize: 20, weight: UIFont.Weight.regular)
    }
    
    public var subHeadingSemibold: UIFont {
        return UIFont.appFontRD(ofSize: 16, weight: UIFont.Weight.semibold)
    }
    
    public var subHeadingRegular: UIFont {
        return UIFont.appFontRD(ofSize: 16, weight: UIFont.Weight.regular)
    }
    
    public var subHeadingMedium: UIFont {
        return UIFont.appFontRD(ofSize: 16, weight: UIFont.Weight.medium)
    }
    
    public var bodySemibold: UIFont {
        return UIFont.appFontRD(ofSize: 14, weight: UIFont.Weight.semibold)
    }
    
    public var bodyRegular: UIFont {
        return UIFont.appFontRD(ofSize: 14, weight: UIFont.Weight.regular)
    }
    
    public var captionSemibold: UIFont {
        return UIFont.appFontRD(ofSize: 12, weight: UIFont.Weight.semibold)
    }
    
    public var captionRegular: UIFont {
        return  UIFont.appFontRD(ofSize: 12, weight: UIFont.Weight.regular)
    }
    
    public var bodyMedium: UIFont {
        return UIFont.appFontRD(ofSize: 14, weight: UIFont.Weight.medium)
    }
    
    public var headlineMedium: UIFont {
        return UIFont.appFontRD(ofSize: 32, weight: UIFont.Weight.medium)
    }
    
    public var subHeadlineMedium: UIFont {
        return UIFont.appFontRD(ofSize: 24, weight: UIFont.Weight.medium)
    }
    
    public var bodyBook: UIFont {
        return UIFont.appFontRD(ofSize: 16)
    }
    
    public var headlineBook: UIFont {
        return UIFont.appFontRD(ofSize: 24)
    }
    
    public var subHeadlineBook: UIFont {
        return UIFont.appFontRD(ofSize: 24)
    }
    
    public func custom(_ size:CGFloat ,_ weight: UIFont.Weight) -> UIFont {
        return UIFont.appFontRD(ofSize: size, weight: weight)
    }
}
