import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(), right.asObservable())

let observable = source.merge()
observable.subscribe(onNext: { print($0)
}).disposed(by: disposeBag)

left.onNext(5)
right.onNext(4)

left.onNext(50)
right.onNext(15)

left.onNext(3)
