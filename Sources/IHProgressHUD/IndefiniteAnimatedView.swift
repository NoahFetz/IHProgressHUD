//
//  Converted to Swift 4 by Swiftify v4.2.29618 - https://objectivec2swift.com/
//
//  IndefiniteAnimatedView.swift
//  SVProgressHUD, https://github.com/SVProgressHUD/SVProgressHUD
//
//  Original Copyright (c) 2014-2018 Guillaume Campagna. All rights reserved.
//  Modified Copyright © 2018 Ibrahim Hassan. All rights reserved.
//

import UIKit
import CoreGraphics

@available(iOSApplicationExtension, unavailable)
class IndefiniteAnimatedView : UIView {
    
    private var activityIndicator : UIActivityIndicatorView?
    private var strokeThickness : CGFloat?
    private var strokeColor : UIColor?
    private var spinner : UIActivityIndicatorView?
    private var indefinteAnimatedLayer : CAShapeLayer?
    private var radius : CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if self.superview != nil {
            self.startAnimation()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ActivityIndicatorView Functions
@available(iOSApplicationExtension, unavailable)
extension IndefiniteAnimatedView {
    
    func removeAnimationLayer() {
        for view in self.subviews {
            if let activityView = view as? UIActivityIndicatorView {
                activityView.removeFromSuperview()
            }
        }
    }
    
    func startAnimation() {
        if let activityIndicator = activityIndicator {
            self.addSubview(activityIndicator)
            activityIndicator.frame = CGRect(x: 8, y: 8, width: self.frame.size.width - 16, height: self.frame.size.height - 16)
        }
    }
    
    func stopActivityIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    func setActivityIndicator(color: UIColor) {
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.startAnimating()
        activityIndicator?.color = color
    }
}

