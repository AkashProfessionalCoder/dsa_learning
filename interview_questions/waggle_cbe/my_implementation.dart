void main() {
  print("main method triggered");
  //   var value = 10;

  //   print(value);

  //   print("${*value}");

  //   Payment payment = Payment();

  //   print(payment.add(10, 20));
  //   print(payment.sub(10, 20));

  var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var val = 4;
  //output = [3,4,5,6,7,8,9,10,1,2]

  // if val = 4
  // then the output will be [5,6,7,8,9,10,1,2,3,4]

  for (int i = 0; i < val; i++) {
    var first = array.removeAt(0);
    print(first);

    array.add(first);
  }

  print("array: $array");
}



abstract class Calc {
  int add(int a, int b) {
    return a + b;
  }

  int sub(int a, int b) {
    return a - b;
  }
}

class Payment extends Calc {
  Payment();
}
