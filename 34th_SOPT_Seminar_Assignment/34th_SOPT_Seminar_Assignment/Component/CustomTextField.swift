//
//  CustomTextField.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/16/24.
//

import UIKit
import Then

final class CustomTextField: UITextField {
    
    // MARK: Views
    private lazy var clearButton = UIButton()
    private lazy var visibleButton = UIButton()
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.backgroundColor = .grayScale(.r46)
        self.cornerRounding(3)
        self.addHorizontalPadding(left:22, right: 22)
        self.clearButtonMode = .never
        
        clearButton.addAction(clearText, for: .touchUpInside)
        visibleButton.addAction(toggleVisibility, for: .touchUpInside)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        clearButton.do {
            $0.setImage(.icCancel, for: .normal)
            $0.tintColor = .grayScale(.r156)
        }
        
        visibleButton.do {
            $0.setImage(.icHideEye, for: .normal)
            $0.tintColor = .grayScale(.r156)
        }
    }
    
    // MARK: private function
    /// 현재 텍스트 필드의 텍스트를 초기화합니다.
    private lazy var clearText = UIAction { [weak self] _ in
        self?.text = ""
    }
    
    /// 현재 텍스트 필드의 텍스트 내용을 숨김/보임 처리합니다.
    private lazy var toggleVisibility = UIAction { [weak self] _ in
        guard let self = self else { return }
        self.isSecureTextEntry.toggle()
        self.visibleButton.setImage(self.isSecureTextEntry ? .icHideEye : .icShowEye, for: .normal)
    }
}

// MARK: external function
extension CustomTextField {
    /// Placeholder를 포함한 TextField의 Text의 속성을 변경합니다.
    /// - Parameter placeHolderStr: Placeholder 텍스트
    /// - Parameter font: Text에 적용할 폰트
    /// - Parameter fontColor: Text에 적용할 색상
    func textSetUp(with placeHolderStr: String, font: UIFont, fontColor: UIColor) {
        let attrStr = NSAttributedString(
            string: placeHolderStr,
            attributes: [
                .font : font,
                .foregroundColor : fontColor
              ])
        
        self.attributedPlaceholder = attrStr
        self.font = font
        self.textColor = fontColor
    }
    
    /// TextField의 RightView에 clearBtn, visibleBtn을 추가합니다.
    func setupRightView(clearBtn: Bool = false, visibleBtn: Bool = false) {
        let btnList = [(clearButton, clearBtn), (visibleButton, visibleBtn)].compactMap {
            if $0.1 { return $0.0 }
            else { return nil }
        }
        let stackView = UIStackView(arrangedSubviews: btnList)
            .then {
                $0.axis = .horizontal
                $0.spacing = 16
                $0.alignment = .center
                $0.frame = CGRect(x: 0, y: 0, width: 60, height: 52)
                $0.isLayoutMarginsRelativeArrangement = true
                $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
            }
        rightView = stackView
        rightViewMode = .whileEditing
    }
}
