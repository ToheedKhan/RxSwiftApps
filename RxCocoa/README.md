# RxCocoa

Custom wrapper to many UI controls and other SDK classes.

## Binding
 
### Using Binding observables

For observable work, we should have a producer and also a receiver, the producer is going to supply
some data to the receiver and it will the data will be binded on some sort of a user interface on the receiver side.
Now, it is very important to note that whether in RxSwift, it is uni directional, binding.
This means the receiver cannot really do a binding from the interface or from the receiver back to the producer.
It's not bidirectional kind of binding that you may notice in other languages.
So if you need additional binding, which means the producer can send to the receiver.

### ControlProperty and Driver
The control property, we have only been using controlled properties whenever you are subscribed to the properties that are exposed using the correct syntax, using the RxCocoa  framework.
**Control Event*

When you click the search button or the done button, the control event gets triggered.

** Driver **
Works on units
** Features **
- Units can't error out
- Units are observed on main scheduler (which is very, very important, because now you don't have to say observe on main
scheduler.)
- Units subscribe on main scheduler
- Units share side effects

This means you can create a driver and then you can start sharing the observation of that particular
driver to bind it or to put it onto the interface.

# Disposing with RxSwift
** weak **
A weak reference is basically when a closure can be called at some point in the future.

** unowned **
The other way around is the unown, which is  simply to avoid the optional self, but the problem.
The limitation of unknown is that you better be sure
that self will never be nil, because if self is nil, then, it's going to blow up and it's going to crash your complete.

** nothing **: Inside a singleton or if you're inside a view controller, which itself is the root view controller.

** unowned **: Inside all view controllers which are released after the closure task is performed.

** weak **: Any other case

# Error handling cases

- No internet connection
- API Error OR HTTP Error
- Invalid Input

Two different ways to handle the error

Observable -> Catch -> Subscriptions (catchErrorJustReturn/CatchAndReturn) (Eg- Invalid City)



Observable -> Retry -> Subscriptions (catchErrorJustReturn/CatchAndReturn) (Eg - No internet connection)

