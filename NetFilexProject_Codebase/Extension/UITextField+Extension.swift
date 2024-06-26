//
//  UITextField+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

extension UITextField {
    
    func primaryTextfield(placeholderText text: String, textAlignment: NSTextAlignment) {
        self.textColor = .white
        self.attributedPlaceholder = NSAttributedString(
            string: text, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        self.font = .systemFont(ofSize: 14)
        self.borderStyle = .roundedRect
        self.textAlignment = textAlignment
        self.layer.cornerRadius = 5
        self.backgroundColor = .clear
        
        
    }
    
}
