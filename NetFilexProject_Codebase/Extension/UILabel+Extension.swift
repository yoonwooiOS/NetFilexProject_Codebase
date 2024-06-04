//
//  UILabel+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

extension UILabel {
    
    func primaryTitleLabel(labelText text:String, textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor) {
        
        self.text = text
        self.font = .boldSystemFont(ofSize: CGFloat(size))
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0
        
        
    }
    
    
    func primarySubTitleLabel(labelText text:String, textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor) {
        
        self.text = text
        self.font = .systemFont(ofSize: CGFloat(size))
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0
        
        
    }
    
}
