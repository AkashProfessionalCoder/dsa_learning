void main() {
  // reverse string
  // var givenString = 'Flutter';
  // reverseString(givenString);

  // Palindrome check

  // var givenString = 'Flutter';
  // var givenString = 'madam';
  // var givenString = 'Akash';
  // palindromeCheck(givenString);

  // character frequency
  // var givenString = 'Akash Senthil';
  // characterFrequency(givenString);

  // firstNonRepeatingChar
  // var givenString = 'akash senthil';
  // firstNonRepeatingChar(givenString);

  // isAnagram
  var firstString = "madam";
  var secondString = "madam";
  isAnagram(firstString, secondString);
}

isAnagram(String firstString, String secondString) {
  bool response = true;
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < firstString.length; i++) {
    frequencyMap[firstString[i]] = (frequencyMap[firstString[i]] ?? 0) + 1;
  }

  for (int i = 0; i < secondString.length; i++) {
    frequencyMap[secondString[i]] = (frequencyMap[secondString[i]] ?? 0) - 1;
  }

  for (int value in frequencyMap.values) {
    if (value != 0) response = false;
  }
  ;

  print("Frequencymap: $frequencyMap");
  print("response: $response");

  return response;
}

String firstNonRepeatingChar(String givenString) {
  String response = 'null';
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < givenString.length; i++) {
    frequencyMap[givenString[i]] = (frequencyMap[givenString[i]] ?? 0) + 1;
  }

  for (final string in givenString.split("")) {
    if (frequencyMap[string] == 1) {
      response = string;
      break;
    }
  }

  print('response: $response');

  return response;
}

Map<String, int> characterFrequency(String string) {
  Map<String, int> frequencyMap = {};

  for (int i = 0; i < string.length; i++) {
    frequencyMap[string[i]] = (frequencyMap[string[i]] ?? 0) + 1;
  }
  print("frequency Map: ${frequencyMap}");

  return frequencyMap;
}

bool palindromeCheck(String string) {
  int start = 0;
  int end = string.length - 1;
  bool isPalindrome = true;

  while (start < end) {
    if (string[start] != string[end]) {
      isPalindrome = false;
      break;
    }

    start++;
    end--;
  }
  print("isPalindrome: $isPalindrome");
  return isPalindrome;
}

String reverseString(String string) {
  List<String> chars = string.split('');
  print(chars);

  int start = 0;
  int end = chars.length - 1;

  while (start < end) {
    var temp = chars[start];
    chars[start] = chars[end];
    chars[end] = temp;

    start++;
    end--;
  }

  var reversedString = chars.join("");
  print("reversed String : ${reversedString}");
  return reversedString;
}
