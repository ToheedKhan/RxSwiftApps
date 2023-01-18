# RxSwiftApps


# Functional Programming

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

Functional programming (FP) is a paradigm which concentrates on computing results rather than on performing actions. When you call a function in a program written with a functional approach, the only significant effect that the function has, is usually to compute a value and return it instead of us giving it a finite set of step-by-step instructions to get the desired results. 

Although, in the functional programming world, behind-the-scenes, the function is, as usual, using its own set of instructions which eventually uses up the CPU time, allocating and writing onto the memory. However, from the programmer’s point of view, the primary effect is the return value. Basically, it is more like an encapsulation of a usual set of instructions providing you with a higher order APIs which you can use to execute those encapsulated instructions to perform certain operations. 

# Declarative Programming
Functional Programming is a subset of declarative languages that has a heavy focus on recursions. Yes, instead of directly using loops, FP uses recursions to perform an operation which can be achieved with immutability. Loops, on the other hand, require mutability.  

# Imperative programming / Object Oriented Programming
Issues due to mutable states
- Concurrency
- Deadlock
- Race conditions


# What is Functional Reactive Programming?
Functional reactive programming (FRP) is a programming paradigm for reactive programming (asynchronousdataflow programming) using the building blocks of functional programming (e.g. map, reduce, filter)  

Basically, Functional Reactive Programming (FRP), is simply a combination of Functional Programming and Reactive Programming. When using functional programming along with reactive, we mostly use Higher Order Functions (HOF’s) which is like an encapsulation layer hiding out the intricate details of any function’s operational sequences. 


Reactive functional programming
in its essence, simplifies developing asynchronus programs by allowing your code to react to new data and process it in sequential manner.

Simplified developing asynchronous programs but allow your code to react to new data and process it in a sequential, isolated manner.

# RxSwift
RxSwift library allows you to write asynchronous code in a much more concise and compact and maintainable way.

Reactive programming basically means relying on entities emitting elements, subscribing to its changes and reacting to those changes. So, reactive programming saves you from having to re-check states and manually putting conditions in your code. It remarkably reduces the code lines and makes the code cleaner and easier to manage. Most importantly, it manages asynchronous code execution in a very elegant manner owing to its observable-subscriber method.

**Reactive programming is programming with asynchronous data streams**
 
These are some basic terminologies that are used while writing code using the Reactive Programming paradigm.

**1. Observable:** It is an entity that can be of any data type and emits elements to its subscribers on happening of every different type of event. Example: it emits error on an error event, emits the received value on an onNext event, etc.

In RxSwift, streams are represented by Observable Sequences. Arrays, Strings or Dictionaries will be converted to observable sequences. You can create an observable sequence of any Object that conforms to the Sequence Protocol from the Swift Standard Library.

**Observable sequences** can emit zero or more events over their lifetime. In RxSwift, an Event is just an Enumeration Type with 3 possible states:

**.next(value: T) : **

 When a value or collection of values is added to an observable sequence it will send the next event to its subscribers as seen above. The associated value will contain the actual value from the sequence.

**.error(error: Error) : **

 If an Error is encountered, a sequence will emit an error event. This will also terminate the sequence.

**.completed : **

If a sequence ends normally it sends a completed event to its subscribers.

**2. Observer:** This subscribes to observables and listens for changes in them and takes the programmed action on any change.
**3. Dispose Bag:** A dispose bag holds disposables in it. So basically, it is used for garbage management in the files. When we create subscriptions, we keep adding them to a global dispose bag in a file. So whenever that particular files’ memory is deallocated the subscriptions are properly disposed off from the dispose bag, so this ensures there are no memory leaks in the project.
**4. Subjects:** Subjects acts dual way, both as an observable as well as an observer. 
After getting events from someone they will forward the results to their subscribers.

A Subject is a special form of an Observable Sequence, you can subscribe and dynamically add elements to it. 

There are currently 4 different kinds of Subjects in RxSwift.

**Publish Subject:** 
It starts empty and only emits new elements to its subscribers. On completion, it still emits completion to its new subscribers.
If you subscribe to it you will get all the events that will happen after you subscribed.
Doesn't need any default value to get started.

**Behavior Subject:** 
Starts with an initial value and replays it or the latest element to new subscribers.
A behaviour subject will give any subscriber the most recent element and everything that is emitted by that sequence after the subscription happened.

**Replay Subject:** 
Initialized with buffer size and will maintain a buffer of elements up to that size and replay it to new subscribers.
If you want to replay more than the most recent element to new subscribers on the initial subscription you need to use a ReplaySubject. With a ReplaySubject, you can define how many recent items you want to emit to new subscribers.

**Async Subject:** 
Emits only the last next event in the sequence, and only when the subject receives a completed event.


**6. Relays:** 
These wrap their respective subjects, but only accept and relay the next events. You cannot add a completed or error event onto relays at all, so they’re great for non-terminating sequences. 
There are two types of relays: **PublishRelay and BehaviorRelay. **
(It was named as ‘Variable’ in < RxSwift 5.0).

**7. Operators:** 
There are different types of operators such as filtering operators, transforming operators, time-based operators which can be chained on observables using the dot operator so that the input from the observable can be modified as per requirement.

**Filtering operators:** 
These operators let you filter out the results received from the data source. There are different type of filtering you can do on data using different operators, for example, .elementAt(index): it gives the element at a particular index, .skip(n): it skips n elements emitted by data source etc.

**Transforming operators:** 
These operators let you transform data received from the data source into a different type. Some examples of this are .toArray(): this operator is used to transform the received elements into an array, .map(): allows you to enter a data type and change it to another data type.

**Combining operators:** 
These operators let you combine results from observables. Example: .concat(): it is a static function that combines two observable sequences, .zip: it is used to couple two operations/requests and aggregate a result once both are done.

**Time-based operators:** 
These operators are used to do operations like buffering and replaying data. Example: replay(): This operator creates a new sequence which records the last ’n’ emitted by the source observable, interval(schedulers: ): it produces an infinite observable sequence of Int values (effectively a counter) sent at the selected interval on the specified scheduler.

**7. Schedulers:** 
A scheduler is a context on which a process takes place. So schedulers here are used to shift subscription contexts. There are different types of schedulers like MainScheduler, Concurrent Schedulers etc. To Switch Schedulers, we use these two operators:

**subscribeOn():** we can switch threads by using this operator.
**observeOn():** this operator changes the scheduler where the observation happens.

A **Dispose bag** is used for memory management, it keeps on collecting subscriptions and then finally it disposes them off when the controller memory is deallocated. It ensures that there are no memory leaks.
‘DisposeBag’ in RxSwift helps you to unsubscribe from the Observable Sequences. 

 ‘DisposeBag’ as a garbage collector that cleans up all the unnecessary instances assigned to it in the app after its usage.


# What is a Stream?
A stream is a sequence of ongoing events ordered in time. It can emit three different things: a value (of some type), an error, or a “completed” signal (which we will see in a bit). Consider the “completed” event that takes place, for instance, when the current window or view/ screen containing that button is closed. Touch events or text typing or any kind of user interaction or the change in the objects are really an asynchronous stream.

# RxCocoa
RxCocoa basically contains UI specific functions built on top of the RxSwift library. These functions help us to configure and use the swift UI components in a reactive way.
