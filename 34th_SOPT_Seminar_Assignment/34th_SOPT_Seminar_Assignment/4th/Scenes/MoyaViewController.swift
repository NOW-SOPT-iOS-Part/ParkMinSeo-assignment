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

#Preview {
    MoyaViewController()
}

