//
//  HomeViewModel.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import RxSwift
import RxRelay
import Differentiator

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
        let sections: Observable<[SectionModel<MainCVSection, MainCVItem>]>
        let normalData: Observable<[NormalContent]>
        let streamData: Observable<[StreamContent]>
    }
    
    // MARK: Transform
    func transform(input: Input) -> Output {
        
        input.cellDidTap.bind(onNext: {
            print("cellDidTap : \($0)")
        })
        .disposed(by: disposeBag)
        
        let sections = Observable<[SectionModel<MainCVSection, MainCVItem>]>.just(
            [
                SectionModel(
                    model: .topCarousel,
                    items: [.topCarousel(
                        [
                            "contentImage1",
                            "contentImage2",
                            "contentImage3",
                            "contentImage4",
                            "contentImage1",
                            "contentImage2",
                            "contentImage3",
                            "contentImage4"
                        ]
                    )]
                ),
                SectionModel(
                    model: .recommend,
                    items: NormalContent.dummyData().map { .recommend($0) }
                ),
                SectionModel(
                    model: .stream,
                    items: StreamContent.dummyData().map { .stream($0) }
                ),
                SectionModel(
                    model: .event,
                    items: NormalContent.dummyData().map { .event($0) }
                ),
                SectionModel(
                    model: .ads,
                    items: AdContent.dummyData().map { .ads($0) }
                ),
                SectionModel(
                    model: .fantastic,
                    items: NormalContent.dummyData().map { .fantastic($0) }
                )
            ]
        )
        
        return Output(
            segments: segments.asObservable(),
            sections: sections,
            normalData: normalData.asObservable(),
            streamData: streamData.asObservable()
        )
    }
}
