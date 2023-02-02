import UIKit
import RxSwift
import PlaygroundSupport

let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.element(at: 2).subscribe(onNext: { _ in
    print("You are out!")
}).disposed(by: disposeBag)

strikes.onNext("X")
strikes.onNext("Y")
strikes.onNext("Z")

