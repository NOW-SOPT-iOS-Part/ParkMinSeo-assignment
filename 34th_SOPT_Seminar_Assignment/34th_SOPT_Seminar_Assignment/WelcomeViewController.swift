//
//  WelcomViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/17/24.
//


import UIKit
import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: Variables
    var userEmail: String?
    
    // MARK: Views
    /// 상단 타이틀 "TVING ID 로그인"
    private let topBarImageView = UIImageView()
    /// 중간 "www님 반가워요!" 라벨
    private let welcomeLabel = UILabel()
    /// 메인으로 버튼
    private let goToMainButton = UIButton()
    
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
        self.goToMainButton.addAction(nextVC, for: .touchUpInside)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        topBarImageView.do {
            $0.image = .imageTopbar
            $0.sizeToFit()
        }

        welcomeLabel.do {
            let attrStr = NSAttributedString(
                string: "\(userEmail ?? "")님\n반가워요!",
                attributes: [
                    .font : UIFont.pretendard(.w700, size: 23),
                    .foregroundColor : UIColor.grayScale(.r214)
                  ])
            $0.numberOfLines = 2
            $0.attributedText = attrStr
        }

        goToMainButton.do {
            let attrStr = NSAttributedString(
                string: "메인으로",
                attributes: [
                    .font : UIFont.pretendard(.w600, size: 14),
                    .foregroundColor : UIColor.white
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.backgroundColor = .primaryRed
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            topBarImageView,
            welcomeLabel,
            goToMainButton,
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        topBarImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(14)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(topBarImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        goToMainButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-66)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: private function
    private lazy var nextVC = UIAction { _ in
        print("가자 메인으로!")
    }
}

#Preview {
    WelcomeViewController()
}
