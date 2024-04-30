//
//  UIColor+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import UIKit

extension UIColor {
    
    /// GrayScaleColor를 Red값 순으로 정의한 enum입니다
    enum GrayScaleLevel {
        case r214
        case r156
        case r98
        case r46
        case r25
        
        /// 해당 GrayScale의 컬러입니다
        var color: UIColor {
            switch self {
                
            case .r214:
                return .gray1
            case .r156:
                return .gray2
            case .r98:
                return .gray3
            case .r46:
                return .gray4
            case .r25:
                return .gray5
            }
        }
    }
    
    /// 해당 GrayScaleLevel에 맞는 GrayScaleColor를 리턴합니다
    /// - Parameter lev: GrayScale Red값
    static func grayScale(_ lev: GrayScaleLevel) -> UIColor {
        return lev.color
    }
}
