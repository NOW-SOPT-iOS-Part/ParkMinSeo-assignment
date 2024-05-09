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
    private let movieAPIService = APIService<MovieTargetType>()
    
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
        self.view.backgroundColor = .gray
        searchButton.addAction(searchAction, for: .touchUpInside)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        titleLabel.do {
            let attrStr = NSAttributedString(
                string: "영화 제목 검색",
                attributes: [
                    .font : UIFont.pretendard(.w800, size: 24),
                    .foregroundColor : UIColor.grayScale(.r214)
                ])
            $0.attributedText = attrStr
        }
        
        searchTextField.do{
            $0.backgroundColor = .grayScale(.r25)
            $0.cornerRounding(10)
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
            $0.backgroundColor = .grayScale(.r25)
            $0.cornerRounding(10)
        }
        
        movieStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = 15
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
            $0.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchTextField)
            $0.leading.equalTo(searchTextField.snp.trailing).offset(20)
            $0.size.equalTo(40)
        }
        
        movieStackView.snp.makeConstraints {
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: private function
    private lazy var searchAction = UIAction { [weak self] _ in
        guard let self, let text = self.searchTextField.text else { return }
        self.movieAPIService.sendRequest(
            target: .getMovies(movieName: text),
            instance: GetMoviesDTO.self
        ) { result in
            switch result {
                
            case .success(let data):
                guard let movie = data.toMovieList().first else { return }
                self.fetchMovieData(movie)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: private function
extension MoyaViewController {
    private func fetchMovieData(_ data: Movie) {
        nameRowView.setContents(header: "영화 제목", content: data.name)
        nameEngRowView.setContents(header: "영화 제목(영문)", content: data.nameEng)
        prdtYearRowView.setContents(header: "제작연도", content: data.prdtYear)
        openDateRowView.setContents(header: "개봉일", content: data.openDate)
        movieTypeRowView.setContents(header: "영화 유형", content: data.movieType)
        genreRowView.setContents(header: "영화 장르", content: data.genre)
        directorsRowView.setContents(header: "제작진", content: data.directors.joined())
    }
}

#Preview {
    MoyaViewController()
}

