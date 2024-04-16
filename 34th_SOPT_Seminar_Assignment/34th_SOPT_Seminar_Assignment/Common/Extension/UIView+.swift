//
//  UIView+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import UIKit

extension UIView {
    func cornerRounding(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}
