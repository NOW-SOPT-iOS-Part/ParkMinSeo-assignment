//
//  UIView+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import UIKit

extension UIView {
    
    /// UIView의 모서리 둥글기 추가
    /// - Parameter radius: 모서리 둥글기 정도
    /// 
    /// clipToBounds를 사용하여,해당 View의 layer 사용 시 주의가 필요합니다
    func cornerRounding(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    /// UIView의 테두리 추가
    /// - Parameter width: 테두리 굵기
    /// - Parameter color: 테두리 색
    func makeBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
