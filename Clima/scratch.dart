import 'dart:io';
void main(){
  process();
}

/*
 Synchronous function means everything will work in a step by step
 Now suppose some function will take huge amount of time to be completed, due to this taks that have to be executed after this method
 will be delayed, so here comes the concept of Asyncrhonous functions
 Now if we want that our tasks does execute step by step and move ahead to do some task till a large function is executing
 then we call this asynchronous function
 we can use async keyword to make a function asyncrhonous
 and can use await to stop futher task from stop executing till this one completes.
 */
void process(){
  task1();
  String result = task2();
  task3(result);
}

void task1(){
  print("Method 1");
}

// Future<String> task2() async{
//
//   Duration threeSecond = Duration(seconds: 3);
//   String result = "x";
//
//    // sleep(threeSecond); //sleep is an synchronous method
//   await Future.delayed(threeSecond, (){
//     result ="Task 2 result";
//     print("task 2");
//   });
//
//   return result;
// }

String task2(){
  Duration threeSecond = Duration(seconds: 3);
  Future.delayed(threeSecond, (){
    print("Task 2 running");
  });
  return "Task 2 completed";
}

void task3(String x){
  print("Method 3 $x");
}
