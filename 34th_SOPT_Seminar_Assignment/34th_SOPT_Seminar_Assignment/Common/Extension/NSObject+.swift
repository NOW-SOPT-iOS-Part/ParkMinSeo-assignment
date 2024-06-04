//
//  NSObject+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import Foundation


extension NSObject {
    /// 해당 클래스의 이름을 String 형태로 반환합니다.
    static var className: String {
        return String(describing: self)
    }
}
