//
//  LoginViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {
    
    // MARK: Views
    /// 상단 타이틀 "TVING ID 로그인"
    private let titleLabel = UILabel()
    /// 아이디 입력 텍스트 필드
    private let idTextField = CustomTextField()
    /// 비밀번호 입력 텍스트 필드
    private let pwTextField = CustomTextField()
    /// 로그인 버튼
    private let loginButton = UIButton()
    /// 아이디 찾기 버튼
    private let findIdButton = UIButton()
    /// 아이디 찾기 | 비밀번호 찾기 중간 구분선
    private let divider = UIView()
    /// 비밀번호 찾기 버튼
    private let findPwButton = UIButton()
    /// 중간 "아직 계정이 없으신가요" 라벨
    private let stillNoAccLabel = UILabel()
    /// 닉네임 만들러가기 버튼
    private let makeNicknameButton = UIButton()
    
    private let clearAction = UIAction(image: .icCancel, handler: { action in
        
    })
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpStyle()
        setUpLayout()
        setUpConstraint()
        
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.view.backgroundColor = .black // == rgba(0,0,0,1)
        idTextField.delegate = self
        pwTextField.delegate = self
        
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        titleLabel.do {
            let attrStr = NSAttributedString(
                string: "TVING ID 로그인",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 23),
                    .foregroundColor : UIColor.grayScale(.r214)
                  ])
            $0.attributedText = attrStr
        }
        
        idTextField.do {
            $0.textSetUp(
                with: "아이디",
                font: .pretendard(.w600, size: 15),
                fontColor: .grayScale(.r156)
            )
        }
                
        pwTextField.do {
            $0.textSetUp(
                with: "비밀번호",
                font: .pretendard(.w600, size: 15),
                fontColor: .grayScale(.r156)
            )
            $0.isSecureTextEntry = true
            $0.setupRightView()
        }
        
        loginButton.do {
            let attrStr = NSAttributedString(
                string: "로그인하기",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.cornerRounding(3)
            $0.makeBorder(width: 1, color: .grayScale(.r46))
        }
        
        findIdButton.do {
            let attrStr = NSAttributedString(
                string: "아이디 찾기",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
        }
        
        divider.do {
            $0.backgroundColor = .grayScale(.r46)
        }
        
        findPwButton.do {
            let attrStr = NSAttributedString(
                string: "비밀번호 찾기",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.grayScale(.r156)
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
        }
        
        stillNoAccLabel.do {
            let attrStr = NSAttributedString(
                string: "아직 계정이 없으신가요?",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.grayScale(.r98)
                  ])
            $0.attributedText = attrStr
        }
        
        makeNicknameButton.do {
            // TODO: 밑줄 색 같은지 체크
            let attrStr = NSAttributedString(
                string: "닉네임 만들러가기",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.grayScale(.r156),
                    .underlineStyle : NSUnderlineStyle.single.rawValue
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            titleLabel,
            idTextField,
            pwTextField,
            loginButton,
            findIdButton,
            divider,
            findPwButton,
            stillNoAccLabel,
            makeNicknameButton
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(31)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.size.equalTo(idTextField)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.size.equalTo(idTextField)
            $0.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.width.equalTo(1)
            $0.height.equalTo(12)
            $0.centerX.equalToSuperview()
        }
        
        findIdButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.right.equalTo(divider.snp.left).offset(-33)
        }
        
        findPwButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.left.equalTo(divider.snp.right).offset(36)
        }
        
        stillNoAccLabel.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(33)
            $0.left.equalToSuperview().offset(51)
        }
        
        makeNicknameButton.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(27)
            $0.left.equalTo(findPwButton)
        }
    }
    
    
    
}

extension LoginViewController: UITextFieldDelegate {
    // 텍스트 필드를 탭해서, 편집 시작 전에 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // textField 검증 후 상태 변경
        switch textField {
        case self.idTextField, self.pwTextField:
            self.setTextFieldState(textField, activate: true)
            return true
        default:
            return false
        }
    }
    
    // 편집이 끝나기 전에 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // textField 검증 후 상태 변경
        switch textField {
        case self.idTextField, self.pwTextField:
            self.setTextFieldState(textField, activate: false)
            return true
        default:
            return false
        }
    }
    
    /// 해당 TextField의 활성화 상태를 UI에 반영합니다.
    /// - Parameter textField: 적용할 텍스트 필드
    /// - Parameter activate: 활성화 상태
    func setTextFieldState(_ textField: UITextField, activate: Bool) {
        textField.makeBorder(width: activate ? 1 : 0, color: .grayScale(.r156))
    }
}

#Preview {
    LoginViewController()
}
