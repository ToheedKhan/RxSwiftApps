import Foundation
import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()


Observable.of(2, 3, 4, 5, 6, 7)
    .take(while: {
         return $0 % 2 == 0
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

print("Done")

Observable.of(1, 2, 3, 4, 5, 6, 7)
    .take(while: {
         return $0 % 2 == 0
    }).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)
/*
 output:-
 
 */
