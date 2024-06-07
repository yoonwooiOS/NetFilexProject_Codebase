//
//  DBUILabel+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/7/24.
//


import UIKit

extension UILabel {
    
    func dbPrimaryLabel(textAlignment:NSTextAlignment,   fontSize size:Int,textColor color:UIColor, backgourndColor bgColor: UIColor) {
        
        self.font = .boldSystemFont(ofSize: CGFloat(size))
        self.textAlignment = textAlignment
        self.textColor = color
        self.numberOfLines = 0
        self.backgroundColor = bgColor
        
    }
}
