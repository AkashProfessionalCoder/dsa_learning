void main() {
  // var givenArray = [1, 5, 8, 7, 2, 3, 9];

  // var result = maxSum(givenArray, 3);

  // print("maxSum: $result");
  dryRunMaxSum();

  // var givenString = "abcdafghidfr";
  // dryRunLongestNonRepetiveSubString();
}

void dryRunLongestNonRepetiveSubString() {
   final testCases = [
    {'input': 'abcabcbb', 'expected': 'abc'},
    {'input': 'bbbbb', 'expected': 'b'},
    {'input': 'pwwkew', 'expected': 'wke'},
    {'input': '', 'expected': ''},
    {'input': 'a', 'expected': 'a'},
    {'input': 'ab', 'expected': 'ab'},
    {'input': 'aa', 'expected': 'a'},
    {'input': 'abba', 'expected': 'ab'},
    {'input': 'dvdf', 'expected': 'vdf'},
    {'input': 'anviaj', 'expected': 'nviaj'},
    {'input': 'abcdef', 'expected': 'abcdef'},
    {'input': 'abccdefgh', 'expected': 'cdefgh'},
    {'input': 'tmmzuxt', 'expected': 'mzuxt'},
    {'input': 'abcddefghijk', 'expected': 'defghijk'},
    {'input': 'aab', 'expected': 'ab'},
  ];
  
  for (int i = 0; i < testCases.length; i++) {
    final input = testCases[i]['input'] as String;
    final expected = testCases[i]['expected'] as String;
  
    final result = findLongestNonRepetiveSubString(input);
  
    print(
      'Test ${i + 1}: ${result == expected ? "PASS" : "FAIL"} | '
      'Input: "$input" | '
      'Expected: "$expected" | '
      'Got: "$result"',
    );
  }
}

String findLongestNonRepetiveSubString(String givenString) {
  Set<String> seen = {};

  int left = 0;
  int maxStart =0;
  int maxLength = 0;

  for (int right = 0; right < givenString.length; right++) {
    var char = givenString[right];

    while (seen.contains(char)) {
      seen.remove(givenString[left]);
      left++;
    }

    seen.add(char);
   int  currentLength= right-left +1;

   if(currentLength> maxLength) {

    maxLength= currentLength;
    maxStart = left;

   }
  }
  return givenString.substring(maxStart, maxStart+maxLength);
}

int maxSum(List<int> givenArray, int n) {
  emptyCheck(givenArray);

  var start = 0;
  int maxSum = 0;
  int windowSum = 0;
  for (int end = 0; end < givenArray.length; end++) {
    windowSum += givenArray[end];
    if (end - start + 1 == n) {
      if (start == 0) {
        maxSum = windowSum;
      }
      if (maxSum < windowSum) maxSum = windowSum;
      windowSum -= givenArray[start];
      start++;
    }
  }

  return maxSum;
}

// int maxSum(List<int> givenArray, int n) {
//   emptyCheck(givenArray);

//   var start = 0;
//   int maxSum = 0;

//   for (int i=n; i < givenArray.length+1; i++) {
//     var sum = 0;
//     for (int j = start; j < i; j++) {
//       sum += givenArray[j];
//     }
//     // print("selected array: ${givenArray.sublist(start, i)} => $sum");
//    if(i==n) maxSum= sum;
//      if (sum > maxSum) {
//       maxSum = sum;
//     }
//     start++;
//   }

//   return maxSum;
// }

void emptyCheck(List givenArray) {
  if (givenArray.isEmpty) throw Exception("Array should not be empty");
}

/// ---------------Dry Run--------------------------------
///
///
void dryRunMaxSum() {
  final testCases = [
    {
      'array': [1, 5, 8, 7, 2, 3, 9],
      'k': 3,
      'expected': 20,
    },
    {
      'array': [2, 5, 1, 8, 2],
      'k': 3,
      'expected': 14,
    },
    {
      'array': [4, 2, 1, 7, 8, 1, 2, 8, 1, 0],
      'k': 3,
      'expected': 16,
    },
    {
      'array': [1, 2, 3, 4, 5],
      'k': 2,
      'expected': 9,
    },
    {
      'array': [5, 4, 3, 2, 1],
      'k': 2,
      'expected': 9,
    },
    {
      'array': [10, 20, 30, 40],
      'k': 1,
      'expected': 40,
    },
    {
      'array': [3, 5, 8, 2],
      'k': 4,
      'expected': 18,
    },
    {
      'array': [0, 0, 0, 0, 0],
      'k': 2,
      'expected': 0,
    },
    {
      'array': [-2, -1, -5, -3],
      'k': 2,
      'expected': -3,
    },
    {
      'array': [-1, 4, -2, 5, -3],
      'k': 2,
      'expected': 3,
    },
  ];

  for (int i = 0; i < testCases.length; i++) {
    final array = testCases[i]['array'] as List<int>;
    final k = testCases[i]['k'] as int;
    final expected = testCases[i]['expected'] as int;

    final result = maxSum(array, k);

    print(
      'Test ${i + 1}: ${result == expected ? "PASS" : "FAIL"} | '
      'Expected: $expected | Got: $result',
    );
  }
}


/// ---------------------------My implementations------------------------------
/// 

// String findLongestNonRepetiveSubString(String givenString) {
//   Set<String> seen = {};

//   int left = 0;
//   int right = 0;

//   String maxSubString = "";
//   List<String> sameLengthMaxString = <String>[];

//   for (int i = 0; i < givenString.length; i++) {
//     // print("seen: $seen");
//     var currentSubString = "";
//     if (!seen.contains(givenString[i])) {
//       seen.add(givenString[i]);
//     } else {
//       // print("else triggered");
//       if (i > 0 && givenString[i - 1] == givenString[i]) {
//         left = i;
//         right = i;
//         seen = {givenString[i]};
//         continue;
//       }
//       left += 1;
//     }
//     right += 1;

//     currentSubString = i == givenString.length - 1
//         ? givenString.substring(left)
//         : givenString.substring(left, right);

//     if (maxSubString.length <= currentSubString.length) {
//       if (maxSubString.length == currentSubString.length) {
//         sameLengthMaxString.add(currentSubString);
//         maxSubString = currentSubString;
//       } else {
//         maxSubString = currentSubString;
//         sameLengthMaxString = [currentSubString];
//       }
//     }
//     // print("left: $left; right: $right; currentSubString: $currentSubString: maxSubString: $maxSubString");
//     // print("sameLengthMaxString: $sameLengthMaxString");

//     // print("-----------------------------");
//   }

//   return sameLengthMaxString.length > 1
//       ? sameLengthMaxString.first
//       : maxSubString;
// }
