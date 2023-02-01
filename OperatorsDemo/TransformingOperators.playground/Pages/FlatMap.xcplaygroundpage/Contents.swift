import UIKit
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()

/*
 Flat map operator, which is very similar to the map operator, flat map projects and transform and observable value of an observable and then flattens it down to a target observable.
 
 flat map operator is great for changing the internal
observable and then flattening it out and returning and observable.
 */

struct Student {
    var score: BehaviorRelay<Int>
}

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))


let student = PublishSubject<Student>()

student.asObservable()
    .flatMap {
        $0.score.asObservable()
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)

john.score.accept(100)

student.onNext(mary)

mary.score.accept(80)

john.score.accept(43)
