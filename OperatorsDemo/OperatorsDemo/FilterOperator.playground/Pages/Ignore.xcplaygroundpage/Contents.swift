import UIKit
import RxSwift
import PlaygroundSupport

/*
 ignore elements, operator is helpful when you don't really care about the actual elements, but you do still want to fire the subscription when the particular sequence or observation is actually completed.
 */

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes
.ignoreElements()
    .subscribe { _ in
        print("[Subscription is called]")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()
