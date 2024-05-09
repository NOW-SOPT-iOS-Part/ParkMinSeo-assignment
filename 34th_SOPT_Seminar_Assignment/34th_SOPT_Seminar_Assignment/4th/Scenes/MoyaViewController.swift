//
//  MoyaViewController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 5/10/24.
//

import UIKit
import SnapKit
import Then

final class MoyaViewController: UIViewController {
    
    // MARK: Variables
    
    // MARK: Views
    private let titleLabel = UILabel()
    private let searchTextField = UITextField()
    private let searchButton = UIButton()
    private let nameRowView = MovieRowView()
    private let nameEngRowView = MovieRowView()
    private let prdtYearRowView = MovieRowView()
    private let openDateRowView = MovieRowView()
    private let movieTypeRowView = MovieRowView()
    private let genreRowView = MovieRowView()
    private let directorsRowView = MovieRowView()
    private lazy var movieStackView = UIStackView(arrangedSubviews: [
        nameRowView,
        nameEngRowView,
        prdtYearRowView,
        openDateRowView,
        movieTypeRowView,
        genreRowView,
        directorsRowView
    ])
    
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
        self.view.backgroundColor = .black
        
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        titleLabel.do {
            let attrStr = NSAttributedString(
                string: "영화 제목 검색",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 23),
                    .foregroundColor : UIColor.grayScale(.r214)
                ])
            $0.attributedText = attrStr
        }
        
        searchTextField.do{
            $0.backgroundColor = .grayScale(.r46)
            $0.cornerRounding(3)
            $0.addHorizontalPadding(left:22, right: 22)
            $0.clearButtonMode = .whileEditing
            
            let attrStr = NSAttributedString(
                string: "영화 제목을 입력하세요",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 15),
                    .foregroundColor : UIColor.grayScale(.r214)
                  ])
            
            $0.attributedPlaceholder = attrStr
            $0.font = UIFont.pretendard(.w500, size: 15)
            $0.textColor = UIColor.grayScale(.r214)
        }
        
        searchButton.do {
            let attrStr = NSAttributedString(
                string: "검색",
                attributes: [
                    .font : UIFont.pretendard(.w500, size: 15),
                    .foregroundColor : UIColor.grayScale(.r214)
                  ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.backgroundColor = .blue
        }
        
        movieStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
        }
    }
    
    // MARK: setUpLayout
    private func setUpLayout() {
        [
            titleLabel,
            searchTextField,
            searchButton,
            movieStackView
        ].forEach { self.view.addSubview($0) }
    }
    
    // MARK: setUpConstraint
    private func setUpConstraint() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(100)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20).priority(.low)
        }
        
        searchTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.width.equalTo(300)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(20)
        }
        
        movieStackView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}

#Preview {
    MoyaViewController()
}

