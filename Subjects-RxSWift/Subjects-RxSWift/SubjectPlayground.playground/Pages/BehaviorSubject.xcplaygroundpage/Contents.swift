import UIKit
import RxSwift
import PlaygroundSupport

/*
 Behavior Subject-
 
 Required initial value
 
 And the reason you have to pass the initial value is that when you subscribe to it, they will give
 you that all value or the initial value or the last value.
 
 */
let disposeBag = DisposeBag()

let subject = BehaviorSubject(value: "Initial value")



subject.onNext("Issue 1")
subject.onNext("Issue 3")

//Always give the last value from previous

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 4")
