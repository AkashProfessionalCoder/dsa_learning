void main() {
  var givenString = "madam";

  // var reversedString = reverseString(givenString);
  // print("reversed String: $reversedString");

  // var result = isPalindrome(givenString);
  // print("isPalindrome: $result");

  // var result = isvalidAnagram("listen", "silenl");
  // print("isValidAnagram: $result");



}




bool isvalidAnagram(String string1, String string2) {
  emptyCheck(string1);
  emptyCheck(string2);
  if (string1.length != string2.length) return false;
  var frequencySet = {};

  for (int i = 0; i < string1.length; i++) {
    frequencySet[string1[i]] = (frequencySet[string1[i]] ?? 0) + 1;
  }

  for (int i = 0; i < string2.length; i++) {
    if (!frequencySet.containsKey(string2[i])) return false;

    frequencySet[string2[i]] -= 1;
  }
  var entriesList = frequencySet.entries.toList();

  print("frequency set: $frequencySet");
  return !entriesList.any((e) => e.value != 0);
}

bool isPalindrome(String givenString) {
  emptyCheck(givenString);
  int start = 0;
  int end = givenString.length - 1;

  while (start < end) {
    if (givenString[start] != givenString[end]) {
      return false;
    }

    start++;
    end--;
  }

  return true;
}

String reverseString(String givenString) {
  emptyCheck(givenString);

  var listString = givenString.split("").toList();
  var start = 0;
  var end = listString.length - 1;

  while (start < end) {
    var temp = listString[start];
    listString[start] = listString[end];
    listString[end] = temp;

    start++;
    end--;
  }

  return listString.join();
}

void emptyCheck(String givenString) {
  if (givenString.isEmpty) throw Exception("String should not be empty");
}
