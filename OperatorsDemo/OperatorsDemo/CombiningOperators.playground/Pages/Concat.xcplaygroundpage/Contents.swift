import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let first = Observable.of(2, 3, 4, 5)
let second = Observable.of(6, 7, 8)
let observable = Observable.concat([first, second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)
