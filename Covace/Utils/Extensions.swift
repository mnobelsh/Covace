//
//  Extensions.swift
//  Covace
//
//  Created by Muhammad Nobel Shidqi on 26/08/20.
//  Copyright © 2020 Muhammad Nobel Shidqi. All rights reserved.
//

import UIKit

extension UIImage {
    static let defaultProfile = UIImage(systemName: "person.fill")!.withRenderingMode(.alwaysOriginal).withTintColor(.backgroundColor)
}

extension UIFont {
    
    enum fontFamily: String {
        case lucidaGrandeBold = "LucidaGrande-Bold"
        case lucidaGrande = "LucidaGrande"
        case defaultFontBold = "Avenir-Heavy"
        case defaultFontStandart = "Avenir"
    }

    
    static func primaryFontBold(fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontFamily.lucidaGrandeBold.rawValue, size: fontSize) else {
            return UIFont(name: fontFamily.defaultFontBold.rawValue, size: fontSize)!
        }
        return font
    }
    
    static func primaryFontStandart(fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontFamily.lucidaGrande.rawValue, size: fontSize) else {
            return UIFont(name: fontFamily.defaultFontStandart.rawValue, size: fontSize)!
        }
        return font
    }
    
}

extension String {
    static func stringify(_ string: String) -> String {
        return string.capitalized
    }
}

extension UIColor {
    static let primaryTextColor = UIColor(named: "primaryTextColor")!
    static let secondaryTextColor = UIColor(named: "secondaryTextColor")!
    static let backgroundColor = UIColor(named: "backgroundColor")!
}

extension UILabel {
    
    enum LabelStyle {
        case primary, secondary
    }
    
    enum HeadingSize: CGFloat {
        case large = 24, medium = 20, small = 16
    }
    
    enum BodySize: CGFloat {
        case large = 18, medium = 14, small = 10
    }
    
    static func heading(for text: String, withSize size: HeadingSize, andStyle style: LabelStyle) -> UILabel {
        let label = UILabel()
        label.text = text
        
        switch style {
            case .primary:
                label.textColor = .primaryTextColor
            case .secondary :
                label.textColor = .secondaryTextColor
        }
        
        label.font = .primaryFontBold(fontSize: size.rawValue)
        return label
    }
    
    static func body(for text: String, withSize size: BodySize, andStyle style: LabelStyle) -> UILabel {
        let label = UILabel()
        label.text = text
        
        switch style {
            case .primary:
                label.textColor = .primaryTextColor
            case .secondary :
                label.textColor = .secondaryTextColor
        }
        
        label.font = .primaryFontBold(fontSize: size.rawValue)
        return label
    }
    
}

extension UIView {
    
    func size(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingRight: CGFloat = 0, paddingBottom: CGFloat = 0, paddingLeft: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let right = trailing {
            self.trailingAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let left = leading {
            self.leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
    }
    
    func setCenterXAnchor(in view: UIView, withConstant constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        if let constant = constant {
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
        }
    }
    
    func setCenterYAnchor(in view: UIView, withConstant constant: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        if let constant = constant {
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        }
    }
    
    func setCenterXYAnchor(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        setCenterXAnchor(in: view)
        setCenterYAnchor(in: view)
    }
    
    enum CornerType {
        case topLeft,topRight,bottomLeft,bottomRight,all
    }
    
    func roundingCorners(for corners: [CornerType], withRadius radius: CGFloat) {
        var roundedCorners = [CACornerMask]()
        for corner in corners {
            switch corner {
                case .all:
                    roundedCorners = [.layerMaxXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMinXMinYCorner]
                case .bottomLeft:
                    roundedCorners.append(.layerMinXMaxYCorner)
                case .bottomRight:
                    roundedCorners.append(.layerMaxXMaxYCorner)
                case .topLeft:
                    roundedCorners.append(.layerMinXMinYCorner)
                case .topRight:
                    roundedCorners.append(.layerMaxXMinYCorner)
            }
        }
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = CACornerMask(roundedCorners)
    }
    
    func shadow(x: CGFloat, y: CGFloat, radius: CGFloat, color: UIColor? = UIColor.lightGray, alpha: Float? = nil) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowOpacity = alpha ?? 1
    }
    
    static func card(size: CGSize,backgroundColor: UIColor = .backgroundColor) -> UIView {
        let view = UIView()
        
        view.backgroundColor = .white
        view.size(width: size.width, height: size.height)
        view.shadow(x: 1, y: 1, radius: 4)
        
        let radius = ((size.width / 10)+(size.height / 10))/2
        view.roundingCorners(for: [.all], withRadius: radius)
        
        return view
    }
    
}
