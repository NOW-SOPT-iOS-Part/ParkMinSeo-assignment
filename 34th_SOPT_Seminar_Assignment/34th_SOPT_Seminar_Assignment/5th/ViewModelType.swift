//
//  ViewModelType.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

/// ViewModel이 준수해야하는 Input-Output-transform protocol입니다.
protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    @discardableResult
    func transform(input: Input) -> Output
}
