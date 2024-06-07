//
//  DBUIButton+Extension.swift
//  NetFilexProject_Codebase
//
//  Created by 김윤우 on 6/7/24.
//

import UIKit

extension UIButton {
    
    func dbPrimaryButton(buttonTitle title: String, titleColor color:UIColor, fontSize size:CGFloat, backgroundColor bgcolor: UIColor, cornerRadius: CGFloat) {
    
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .boldSystemFont(ofSize: size)
        self.backgroundColor = bgcolor
        self.layer.cornerRadius = cornerRadius
    }
}
