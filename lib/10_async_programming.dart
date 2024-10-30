//Asyncronous programming:
// 1. Future
// 2. async
// 3. await
// 4. then
// 6. Future.wait
// 9. Future.delayed

// //=========================================================================================================
// //1- Future
//
// //A Future is used to represent a potential value or error that will be available at some time in the future.
// //example:
//
Future<int> fetchUserAge() {
  return Future.delayed(Duration(seconds: 3), () => 42);
}

// void main() {
//   fetchUserAge().then((value) {
//     print('User age is: $value');
//   });
//   print('Fetching user age...');  //note: this line will be printed before the Future completes.
// }

// //note: The then() method is used to register a callback that will be called when the Future completes.
//
// //note: The Future.delayed() constructor is used to create a Future that completes after a specified duration.


// //=========================================================================================================

// //=========================================================================================================
// //2- async and await
//
// //The async keyword is used to mark a function as asynchronous.
// //The await keyword is used to pause the execution of a function until the Future completes.
// //example:
Future<void> fetchUserAge2() async {
  print('Fetching user order...');
  var age = await fetchUserAge();
  print('Your order is: $age');
}

// void main() {
//   fetchUserAge2();
// }
//
// //note: The await keyword is used to pause the execution of a function until the Future completes.
// //note: The async keyword can be used with functions that return Future, Stream, or void.


// //=========================================================================================================




// //=========================================================================================================
// //6- Future.wait
//
// //The Future.wait() function is used to wait for multiple Futures to complete.
// //It takes a list of Futures as input and returns a new Future that completes when all the input Futures have completed.
// //they all start at the same time, and the Future.wait() function waits for all of them to complete.

// //example:
// void main() {
//   Future.wait([
//     fetchUserAge(),
//     fetchUserAge(),
//     fetchUserAge(),
//   ]).then((List<int> values) {
//     print('User ages are: $values');
//   });
// }

//Notice the difference between Future.wait, and the simple await keyword:
//example:
void fetchAllAges() async{
  var age1 = await fetchUserAge();
  print("User age is: $age1");
  var age2 = await fetchUserAge();
  print("User age is: $age2");
  var age3 = await fetchUserAge();
  print("User age is: $age3");
  print('User ages are: $age1, $age2, $age3');
}

void main() {
  fetchAllAges();
}
//The difference is that the Future.wait() function waits for all the Futures to complete before calling the callback, but one doesn't have to wait for the other to complete(they all start at the same time, and each one takes it time to complete in parallel).
// while the await keyword waits for each Future to complete before moving on to the next one.
// //=========================================================================================================//
