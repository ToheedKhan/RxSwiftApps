import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left, right, resultSelector: { lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
})

let disposable = observable.subscribe(onNext: {
    value in
    print(value)
})
disposable.disposed(by: disposeBag)


left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(40)
