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
    private let idTextField = UITextField()
    /// 비밀번호 입력 텍스트 필드
    private let pwTextField = UITextField()
    /// 로그인 버튼
    private let loginButtin = UIButton()
    /// 아이디 찾기 버튼
    private let findIdButton = UIButton()
    /// 비밀번호 찾기 버튼
    private let findPwButton = UIButton()
    /// 중간 "아직 계정이 없으신가요" 라벨
    private let stillNoAccLabel = UILabel()
    /// 닉네임 만들러가기 버튼
    private let makeNicknameButton = UIButton()
    
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
        
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [

        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {

    }
    
    
    
}
