
import Foundation
import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skip(until: trigger)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")
