//
//  MovieRowView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import UIKit
import SnapKit
import Then

final class MovieRowView: UIView {
    
    // MARK: Views
    private let rowHeaderLabel = UILabel().then {
        $0.font =  UIFont.pretendard(.w500, size: 15)
        $0.textColor = UIColor.grayScale(.r46)
    }
    
    private let rowContentLabel = UILabel().then {
        $0.font =  UIFont.pretendard(.w300, size: 12)
        $0.textColor = UIColor.grayScale(.r46)
        $0.numberOfLines = 3
    }
    
    private lazy var stackView = UIStackView(arrangedSubviews: [
        rowHeaderLabel,
        rowContentLabel
    ]).then {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.backgroundColor = .grayScale(.r214)
        $0.cornerRounding(5)
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        self.addSubview(stackView)
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MovieRowView {
    /// MovieRowView의 콘텐트 내용을 설정합니다
    func setContents(header: String, content: String) {
        self.rowHeaderLabel.text = header
        self.rowContentLabel.text = content
    }
}
