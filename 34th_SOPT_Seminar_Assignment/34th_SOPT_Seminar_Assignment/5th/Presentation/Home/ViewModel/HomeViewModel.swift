//
//  HomeViewModel.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import RxSwift
import RxRelay

final class HomeViewModel: ViewModelType {
    
    // MARK: Properties
    let segments = Observable<[Segments]>.just(Segments.allCases)
    let normalData = BehaviorRelay<[NormalContent]>(value: NormalContent.dummyData())
    let streamData = BehaviorRelay<[StreamContent]>(value: StreamContent.dummyData())
    let disposeBag = DisposeBag()
    
    // MARK: Input
    struct Input {
        let cellDidTap: Observable<Segments>
    }
    
    // MARK: Output
    struct Output {
        let segments: Observable<[Segments]>
        let normalData: Observable<[NormalContent]>
        let streamData: Observable<[StreamContent]>
    }
    
    // MARK: Transform
    func transform(input: Input) -> Output {
        
        input.cellDidTap.bind(onNext: {
            print("cellDidTap : \($0)")
        })
        .disposed(by: disposeBag)
        
        return Output(
            segments: segments.asObservable(),
            normalData: normalData.asObservable(),
            streamData: streamData.asObservable()
        )
    }
}
