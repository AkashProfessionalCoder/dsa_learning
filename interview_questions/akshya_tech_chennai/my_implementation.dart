//Write a function that takes an array of numbers and returns the top 2 most
// frequent numbers,If there is a tie , return  the smaller  number first

void main() {
  var givenArray = [1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 6, 6, 6, 6];
  // output = [6,3];

  frequentNumbers(givenArray);

    String a = 'madam';
    String b = 'akash';

    isPalindrome(a);
    isPalindrome(b);
}

void frequentNumbers(List<int> givenArray) {
  var frequencyMap = {};

  for (int i = 0; i < givenArray.length; i++) {
    var num = givenArray[i];

    frequencyMap[num] = (frequencyMap[num] ?? 0) + 1;
  }

 
  var entries = frequencyMap.entries.toList();

  entries.sort((a, b) {
    var valueCompare = b.value.compareTo(a.value);

    if (valueCompare == 0) {
      return a.key.compareTo(b.key);
    }

    return valueCompare;
  });

  var output = entries.take(2).map((e) => e.key).toList();
  print("output : $output");
}

bool isPalindrome(String string) {
  var start = 0;
  var end = string.length - 1;

  while (start < end) {
    //     print('Start: $start, end: $end');
    if (string[start] != string[end]) {
      print("The given String is not palindrome");

      return false;
    }

    start++;
    end--;
  }

  print("The given string is a palindrome");

  return true;
}
