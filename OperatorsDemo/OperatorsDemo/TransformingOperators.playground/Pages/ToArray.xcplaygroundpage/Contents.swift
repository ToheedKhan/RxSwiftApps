import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

Observable.of(1, 2, 3, 4, 5)
    .toArray().subscribe({
        print($0)
    }).disposed(by: disposeBag)
