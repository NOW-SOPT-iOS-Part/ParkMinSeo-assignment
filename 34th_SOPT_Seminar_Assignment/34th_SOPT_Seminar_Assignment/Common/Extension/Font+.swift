//
//  Font+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//


import UIKit

extension UIFont {
    
    /// Pretendard 폰트를 Weight 별로 정의한 enum입니다
    enum PretendardInWeight {
        case w100
        case w200
        case w300
        case w400
        case w500
        case w600
        case w700
        case w800
        case w900
        
        /// 해당 폰트의 폰트 이름입니다
        var name: String {
            switch self {
                
            case .w100:
                return "Pretendard-Thin"
            case .w200:
                return "Pretendard-ExtraLight"
            case .w300:
                return "Pretendard-Light"
            case .w400:
                return "Pretendard-Regular"
            case .w500:
                return "Pretendard-Medium"
            case .w600:
                return "Pretendard-SemiBold"
            case .w700:
                return "Pretendard-Bold"
            case .w800:
                return "Pretendard-ExtraBold"
            case .w900:
                return "Pretendard-Black"
            }
        }
        
        // 해당 폰트의 실제 weight값입니다
        var toFloat: CGFloat {
            switch self {
                
            case .w100:
                return 100
            case .w200:
                return 200
            case .w300:
                return 300
            case .w400:
                return 400
            case .w500:
                return 500
            case .w600:
                return 600
            case .w700:
                return 700
            case .w800:
                return 800
            case .w900:
                return 900
            }
        }
    }
    
    /// 해당 weight와 size에 맞는 pretendard 폰트를 리턴합니다
    /// - Parameter weight: 폰트 weight
    /// - Parameter size: 폰트 size
    static func pretendard(_ weight: PretendardInWeight, size: CGFloat) -> UIFont {
        return UIFont(name: weight.name, size: size) ?? UIFont.systemFont(ofSize: weight.toFloat)
    }
}

