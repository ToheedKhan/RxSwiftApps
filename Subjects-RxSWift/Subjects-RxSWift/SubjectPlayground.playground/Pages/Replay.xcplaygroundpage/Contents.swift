import UIKit
import RxSwift
import PlaygroundSupport

/*
 replay subject basically replays the
 events based on the Buffer size that you're going to set.
.
 */

let disposeBag = DisposeBag()

/* This means that when new subscribers are going to subscribe to this subject, they will automatically
 replay the last two values that were emitted by that subject.*/
let subject = ReplaySubject<String>.create(bufferSize: 2)

subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.subscribe { event in
    print("1---- \(event)")
}

//print("End")
subject.onNext("Issue 4")
subject.onNext("Issue 5")
subject.onNext("Issue 3")

print("[Subscription 2]")

subject.subscribe {
    print($0)
}

subject.onNext("Issue 8")
