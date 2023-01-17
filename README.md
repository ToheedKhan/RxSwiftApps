# RxSwiftApps


#Functional Programming

Mutabililty - Everything immutable.
Everything in function programming, the variables that you create are actually constant.

**First class/ High order functions**
in function programming is a higher order function, meaning a function that can take and return another
function.
- filter
- reduce
- map

Everything in functional programming is also a pure function.
This means that a function will **always** produce the same output when given the same input 
The function creates **zero** side effects outside of it.

#Imperative programming / Object Oriented Programming
Issues due to mutable states
- Concurrency
- Deadlock
- Race conditions


#RxSwift

Reactive functional programming
in its essence, simplifies developing asynchronus programs by allowing your code to react to new data and process it in sequential manner.

Simplified developing asynchronous programs but allow your code to react to new data and process it in a sequential, isolated manner.

RxSwift library allows you to write asynchronous code in a much more concise and compact and maintainable way.


##Subjects
Observable as well as observer
After getting events from someone they will forward the results to their subscribers.

A Subject is a special form of an Observable Sequence, you can subscribe and dynamically add elements to it. 
There are currently 4 different kinds of Subjects in RxSwift.

**PublishSubject:** If you subscribe to it you will get all the events that will happen after you subscribed.
Doesn't need any default value to get started.

Any issue after disposing will be ignored
**BehaviourSubject:** A behaviour subject will give any subscriber the most recent element and everything that is emitted by that sequence after the subscription happened.
**ReplaySubject:** If you want to replay more than the most recent element to new subscribers on the initial subscription you need to use a ReplaySubject. With a ReplaySubject, you can define how many recent items you want to emit to new subscribers.
**Variable:** A Variable is just a BehaviourSubject wrapper that feels more natural to a none reactive programmers. It can be used like a normal Variable.
