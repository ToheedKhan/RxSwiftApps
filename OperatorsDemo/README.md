** Filtering Operators **
Filtering operation removes the unwanted items from the sequence for us.


** Transforming operators **
Transforming operators allow us to change the observable data into a new sequence, transform it into a sequence that we are looking for.
So this might be prepping from data which is coming from an observable that we may need to bind to a collection view or a table view.
It might be some data that is coming from a Web service and we want to transform it into a different form.

* ** ToArray **
* ** Map **
* ** FlatMap **
 Flat map operator, which is very similar to the map operator, flat map projects and transform and observable value of an observable and then flattens it down to a target observable.
 
 flat map operator is great for changing the internal
observable and then flattening it out and returning and observable.

* ** FlatMapLatest **
It only observes to the latest observable.

** Combining Operators **
* ** StartsWith **
* ** Concat **
* ** Merge ** - Merge based on arrival
* ** CombineLatest ** It always keep track of the latest values which are coming from left and right sequences.
* ** WithLatestFrom **
* ** Reduce **
* ** Scan **
