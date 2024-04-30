//
//  topView.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/30/24.
//

import UIKit

final class topView: UIView {
    
    // MARK: Views
    private let tvingImageView = UIImageView(image: .tving)
    private let profileIamgeView = UIImageView(image: .icDoosan)
    
    // MARK: view init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
        setUpLayout()
        setUpConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        if let gradientLayer = layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = bounds
        }
    }
    
    private func setupGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor.clear.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.addSublayer(gradientLayer)
    }
    
    private func setUpLayout() {
        [
            tvingImageView,
            profileIamgeView
        ].forEach { self.addSubview($0) }
    }
    
    private func setUpConstraint() {
        tvingImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(11)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(25)
        }
        
        profileIamgeView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-11)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
    }

}
