//
//  CustomUIViews.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import UIKit

class RoundTopLeftBottomRightView: UIView {
    var corners: UIRectCorner = [] {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var bottomLeft: Bool = false {
        didSet {
            if bottomLeft {
                corners.update(with: .bottomLeft)
            }
        }
    }
    @IBInspectable var bottomRight: Bool = false {
        didSet {
            if bottomRight {
                corners.update(with: .bottomRight)
            }
        }
    }
    @IBInspectable var topLeft: Bool = false {
        didSet {
            if topLeft {
                corners.update(with: .topLeft)
            }
        }
    }
    @IBInspectable var topRight: Bool = false {
        didSet {
            if topRight {
                corners.update(with: .topRight)
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var viewBorderColor: UIColor =
    UIColor.black.withAlphaComponent(0.4) {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewBorderWidth: CGFloat = 0.4 {
        didSet {
            layoutSubviews()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = viewBorderColor.cgColor
        layer.borderWidth = viewBorderWidth
        let path = UIBezierPath(roundedRect: self.bounds,byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class RoundedviewWithBorder: UIView {
    @IBInspectable var viewCornerRadius: CGFloat = 5 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewBorderColor: UIColor =
    UIColor.black.withAlphaComponent(0.4) {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewBorderWidth: CGFloat = 0.4 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewShadowRadius: CGFloat = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewShadowOpacity: Float = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewShadowOffSet: CGSize = .zero {
        didSet {
            layoutSubviews()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = viewBorderColor.cgColor
        layer.borderWidth = viewBorderWidth
        layer.cornerRadius = viewCornerRadius
        layer.shadowRadius = viewShadowRadius
        layer.shadowOpacity = viewShadowOpacity
        layer.shadowOffset = viewShadowOffSet
    }
}

class RoundedviewWithShadow: UIView {
    @IBInspectable var viewCornerRadius: CGFloat = 5 {
        didSet {
            layoutSubviews()
        }
    }
    var viewClipToBounds: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    var viewMasksToBounds: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    var viewShadowOpacity: Float = 0.6 {
        didSet {
            layoutSubviews()
        }
    }
    var viewShadowRadius: CGFloat = 3 {
        didSet {
            layoutSubviews()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowRadius = viewShadowRadius
        layer.shadowOpacity = viewShadowOpacity
        layer.cornerRadius = viewCornerRadius
        layer.masksToBounds = viewMasksToBounds
        layer.shadowOffset = .zero
        clipsToBounds = viewClipToBounds
    }
}

class RoundedviewWithCustomShadow: UIView {
    @IBInspectable var viewCornerRadius: CGFloat = 5 {
        didSet {
            layoutSubviews()
        }
    }
    var viewClipToBounds: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    var viewMasksToBounds: Bool = true {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var viewShadowOpacity: Float = 0.6 {
        didSet {
            layoutSubviews()
        }
    }
    @IBInspectable var viewShadowRadius: CGFloat = 3 {
        didSet {
            layoutSubviews()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowRadius = viewShadowRadius
        layer.shadowOpacity = viewShadowOpacity
        layer.cornerRadius = viewCornerRadius
        layer.masksToBounds = viewMasksToBounds
        layer.shadowOffset = .zero
        clipsToBounds = viewClipToBounds
    }
}

