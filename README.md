# 📅 Flutter Clock App

A beautifully designed and fully functional clock app built using Flutter. This app features multiple clock designs, alarms, timers, and a world clock feature, making it the perfect companion for managing your time effectively.

## 🚀 Features

- **Digital Clock**: Modern Digital Clock with Date and Time
- **Analog Clock**: Classic styled Analog Clock
- **Timers**: Use countdown timers for various tasks.
- **Strap Watch**: New Strap styled watch

## 📸 Screenshots

Analog Clock

<img src = "https://github.com/kunal-gangani/Time_Wave_Clock_App/assets/150250846/5c757872-dcd2-4ee7-a938-e3538b23b3d8" height = "400em">

Digital Clock

<img src = "https://github.com/kunal-gangani/Time_Wave_Clock_App/assets/150250846/a821bdd9-aa9e-4246-a7f7-6a89208f42dd" height = "400em">

Strap Watch

<img src = "https://github.com/kunal-gangani/Time_Wave_Clock_App/assets/150250846/87981439-63db-4130-8b83-2c9a3116de26" height = "400em">

Timer / Stopwatch

<img src = "https://github.com/kunal-gangani/Time_Wave_Clock_App/assets/150250846/c8af3b37-75d5-4786-ac8b-9bca6b5dcc95" height = "400em">



## 📦 Installation

### Prerequisites

- Flutter installed on your machine. [Get Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code setup for Flutter development.



#### Q1)What is  Asynchronous Programming?
=> Asynchronous programming is a method of programming that allows a program to perform tasks without waiting for other tasks to complete. It is particularly useful for tasks that involve waiting, such as reading from a file, making network requests, or interacting with databases. This approach helps in improving the efficiency and responsiveness of programs, especially in scenarios where there are multiple I/O-bound tasks.

#### Q2) What is Future Class ?
=> The Future class is an essential concept in many programming languages, particularly those that support asynchronous programming, such as Dart (used in Flutter). A Future represents a value or error that will be available at some point in the future, and it is a way to work with asynchronous operations.

#### Q3) What is Duration class & Future.delayed() constructor with Example ?
=> In Dart (the language used for Flutter), the Duration class represents a span of time. It is typically used to define time intervals for tasks like animations, waiting periods, and scheduled events. 
The Future.delayed() constructor is a convenient way to introduce a delay before executing a piece of code asynchronously.

// Create a Duration of 5 seconds
Duration fiveSeconds = Duration(seconds: 5);

// Create a Duration of 1 minute and 30 seconds
Duration oneMinuteThirtySeconds = Duration(minutes: 1, seconds: 30);

import 'dart:async';

void main() {
  // Print a message after a 3-second delay
  Future.delayed(Duration(seconds: 3), () {
    print('This message is printed after a 3-second delay.');
  });

  // Print a message immediately
  print('This message is printed immediately.');
}

#### Q4) What is the Use of the async & await keyword?
=> In Dart, the async and await keywords are used to work with asynchronous code, making it easier to read and write compared to traditional callback-based approaches. They help in writing asynchronous code that looks and behaves more like synchronous code, which improves readability and maintainability.

async Keyword
The async keyword is used to mark a function as asynchronous. An async function returns a Future, which means it can perform asynchronous operations.

await Keyword
The await keyword is used to pause the execution of an async function until the awaited Future completes. The await keyword can only be used inside an async function.

#### Q5) What is Recursion ? With Example. 
=> Recursion is a programming technique where a function calls itself in order to solve smaller instances of the same problem. This approach can simplify complex problems by breaking them down into more manageable sub-problems. Recursion typically involves a base case to stop the recursive calls and a recursive step that reduces the problem size.
int factorial(int n) {
  // Base case: if n is 0, return 1
  if (n == 0) {
    return 1;
  }
  // Recursive case: n * factorial of (n-1)
  return n * factorial(n - 1);
}

void main() {
  int number = 5;
  int result = factorial(number);
  print('Factorial of $number is $result');
}

#### Q6) What is Timer class with example ?
=> In Dart, the Timer class is used to create a timer that runs a function either once after a specified duration or repeatedly at regular intervals. This is useful for tasks such as delaying execution, scheduling periodic tasks, or implementing timeouts.
import 'dart:async';

void main() {
  print('Timer started...');

  Timer(Duration(seconds: 5), () {
    print('This message is printed after a 5-second delay.');
  });

  print('This message is printed immediately.');
}

#### Q6) What is Timer.periodic and use with Example?
=> The Timer.periodic constructor in Dart creates a timer that repeatedly calls a specified callback function at a fixed interval. This is useful for tasks that need to run periodically, such as updating a user interface, checking the status of something, or performing regular updates.
import 'dart:async';

void main() {
  print('Periodic timer started...');

  // Create a periodic timer
  Timer.periodic(Duration(seconds: 2), (Timer timer) {
    print('This message is printed every 2 seconds.');
    if (timer.tick >= 5) {
      timer.cancel();
      print('Periodic timer stopped.');
    }
  });
}
