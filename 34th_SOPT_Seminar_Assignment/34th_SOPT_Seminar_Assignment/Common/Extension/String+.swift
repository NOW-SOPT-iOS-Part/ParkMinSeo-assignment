//
//  String+.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import Foundation

extension String {
    /// String이 Email 형식에 맞는지 확인합니다
    /// - 이메일 주소는 @ 기호로 나누어져야 합니다.
    /// - @ 앞에는 최소한 하나 이상의 영문자, 숫자, 밑줄(_), 마침표(.), 퍼센트(%), 덧셈(+), 또는 하이픈(-) 문자가 올 수 있습니다.
    /// - 도메인 주소는 최소한 하나 이상의 영문자 또는 숫자가 포함된 하나 이상의 문자열이어야 합니다.
    /// - 도메인 주소는 최소한 하나 이상의 마침표(.)로 나누어져야 합니다.
    /// - 도메인의 마지막 부분은 최소한 두 개의 문자를 포함해야 합니다 (예: .com, .net, .org 등).
    func isValidEmail() -> Bool {
        let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    /// String이 Password 형식에 맞는지 확인합니다.
    /// - 최소 8자 이상, 최대 20자 이하의 길이를 가져야 합니다.
    /// - 적어도 하나의 영문자(대소문자 구분)와 하나의 숫자가 포함되어야 합니다.
    func isValidPassword() -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,20}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: self)
    }
    
    /// String이 Nickname 형식에 맞는지 확인합니다.
    ///  - 최소 1자 이상, 최대 10자 이하의 길이를 가져야 합니다.
    ///  - 한글 입력만 가능합니다.
    func isValidNickname() -> Bool {
        let nickRegex = "[가-힣]{1, 10}"
        let nickPredicate = NSPredicate(format: "SELF MATCHES %@", nickRegex)
        return nickPredicate.evaluate(with: self)
    }
}
