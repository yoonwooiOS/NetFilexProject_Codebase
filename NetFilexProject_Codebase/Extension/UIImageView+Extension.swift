//
//  UIImageView+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

extension UIImageView {
    
    func primaryImageView(assetName name:String, contendMode: UIView.ContentMode, cornerRadius:CGFloat ) {
        
        
        self.image = UIImage(named: name)
        self.contentMode = contendMode
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        
        
    }
        
    }
