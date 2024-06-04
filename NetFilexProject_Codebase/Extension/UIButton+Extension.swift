//
//  UIButton+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/4/24.
//

import UIKit

extension UIButton {
    
    func primaryButton(buttonTitle title: String, titleColor color:UIColor, fontSize size:CGFloat, backgroundColor bgcolor: UIColor, cornerRadius: CGFloat, assetImageName name: String) {
        
        self.setImage(UIImage(named: name ), for: .normal)
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .boldSystemFont(ofSize: size)
        self.backgroundColor = bgcolor
        self.layer.cornerRadius = cornerRadius
//        self.contentVerticalAlignment = .fill
//        self.contentHorizontalAlignment = .fill
//        self.configuration?.imagePadding = 2
        
    }
    
}
