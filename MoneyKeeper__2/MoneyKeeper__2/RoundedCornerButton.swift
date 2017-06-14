//
//  RoundedCornerButton.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/31/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornerButton: UIButton {
    @IBInspectable
    var borderWidth: CGFloat = 1 {
        didSet {
            self.layer.borderWidth = CGFloat(borderWidth)
        }
    }
    @IBInspectable
    var borderColor: UIColor = UIColor.black {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = -1 {
        didSet {
            if cornerRadius == -1 {
                self.layer.cornerRadius = self.bounds.width < self.bounds.height ? self.bounds.width * 0.5 : self.bounds.height * 0.5
            } else {
                self.layer.cornerRadius = cornerRadius
            }
            self.clipsToBounds = true
        }
    }
}
