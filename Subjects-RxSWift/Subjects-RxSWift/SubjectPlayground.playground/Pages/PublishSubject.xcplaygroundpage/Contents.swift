import Foundation
import RxSwift
import PlaygroundSupport

/*
 Subjects are
 Observable as well as Observer (subscribers as well as observers)
 Get events from someone and then they  forward the result to their subscribers.
 */

/*
 Publish Subject
 
 Doesn't need any default value to get started
 */

let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe { event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")

//subject.dispose()

subject.onCompleted()
subject.onNext("Issue 5")
