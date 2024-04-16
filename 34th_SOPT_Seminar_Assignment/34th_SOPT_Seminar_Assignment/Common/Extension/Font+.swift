//
//  Font+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//


import UIKit

extension UIFont {
    
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
    
    static func pretendard(_ weight: PretendardInWeight, size: CGFloat) -> UIFont {
        return UIFont(name: weight.name, size: size) ?? UIFont.systemFont(ofSize: weight.toFloat)
    }
}

