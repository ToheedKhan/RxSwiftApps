import Foundation
import RxSwift
import RxCocoa
import PlaygroundSupport

let disposeBag = DisposeBag()


let relay = BehaviorRelay(value: "InitialValue")

relay.asObservable()
    .subscribe{
        print("relay - ", $0)
    }

relay.accept("Hello World")


let relay1 = BehaviorRelay(value: ["Item 2"])


relay1.asObservable()
    .subscribe{
        print("relay1 - ", $0)
    }


let relay2 = BehaviorRelay(value: ["Item 1"])

var value = relay2.value
value.append("Item 2")
value.append("Item 3")

relay2.accept(value)

relay2.asObservable()
    .subscribe{
        print("relay2 - ", $0)
    }
