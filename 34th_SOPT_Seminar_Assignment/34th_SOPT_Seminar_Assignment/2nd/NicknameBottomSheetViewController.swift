//
//  NicknameBottomSheetViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/17/24.
//

import UIKit
import SnapKit
import Then

final class NicknameBottomSheetViewController: UIViewController {
    
    // MARK: Variables
    weak var delegate: DataProvider? 
    
    // MARK: Views
    private let nicknamePleaseLabel = UILabel()
    private let nicknameTextField = CustomTextField()
    private let saveButton = UIButton()
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpStyle()
        setUpLayout()
        setUpConstraint()
        setSaveButtonStatus(isActive: false) // 저장 버튼 비활성화
        
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.view.backgroundColor = .white
        nicknameTextField.delegate = self
        saveButton.addAction(saveNickname, for: .touchUpInside)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        nicknamePleaseLabel.do {
            let attrStr = NSAttributedString(
                string: "닉네임을 입력해주세요!",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 23),
                    .foregroundColor : UIColor.black
                ])
            $0.attributedText = attrStr
        }
        
        nicknameTextField.do {
            $0.textSetUp(
                with: "닉네임",
                font: .pretendard(.w600, size: 15),
                fontColor: .grayScale(.r156)
            )
        }
        
        saveButton.do {
            let attrStr = NSAttributedString(
                string: "저장하기",
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
            nicknamePleaseLabel,
            nicknameTextField,
            saveButton
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        nicknamePleaseLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20).priority(.low)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(nicknamePleaseLabel.snp.bottom).offset(21)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: touchesEnded
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        // 터치된 뷰를 가져옵니다.
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self.view)
        let tappedView = self.view.hitTest(touchLocation, with: event)
        
        // TextField 이외의 다른 곳을 탭했을 때 해당 TextField의 편집을 종료합니다.
        if tappedView != nicknameTextField { nicknameTextField.endEditing(true) }
    }
    
    // MARK: private function
    /// 닉네임을 저장하고, 화면을 닫습니다.
    private lazy var saveNickname = UIAction { [weak self] _ in
        if let nickname = self?.nicknameTextField.text {
            self?.delegate?.setNickname(nickname)
        }
        self?.dismiss(animated: true)
    }
    
    /// 저장하기 버튼의 활성화 여부에 따라 UI 상태와 enable 여부를 반영합니다.
    private func setSaveButtonStatus(isActive: Bool) {
        let attrStr = NSAttributedString(
            string: "저장하기",
            attributes: [
                .font : UIFont.pretendard(.w600, size: 14),
                .foregroundColor : isActive ? UIColor.white : UIColor.grayScale(.r156)
              ])
        self.saveButton.setAttributedTitle(attrStr, for: .normal)
        self.saveButton.makeBorder(width: isActive ? 0 : 1, color: .grayScale(.r46))
        self.saveButton.backgroundColor = isActive ? .primaryRed : .white
        self.saveButton.isEnabled = isActive
    }
}

extension NicknameBottomSheetViewController: UITextFieldDelegate {
    // 편집이 끝나기 전에 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let nameText = self.nicknameTextField.text else { return true }

        // nickName textField 정규식 검증, 반영
        self.setSaveButtonStatus(isActive: nameText.isValidNickname())
        return true
    }
}
