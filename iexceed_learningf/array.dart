// ### 1. Find Maximum
// [2,5,1,9,7]
// Output: 9

void main() {
  List<int> givenArray = [1, 2, 4, 2, 9, 44, 9, 5];

  //   var maximumNumber = findMaximum(givenArray);
  //   print("maximumNumber: $maximumNumber");

  //     var secondLargest = findSecondLargest(givenArray);
  //   print("secondLargest: $secondLargest");

  //   var rotateArray = rotateArrayAtK(givenArray, 2);
  //   print("rotateArrayatK: $rotateArray");

  //   var movedZeros = moveZeros(givenArray);
  //   print("movedzeros: $movedZeros");

  var twoSums = twoSum(givenArray, 9);
  print("twosums: $twoSums");

    // var givenStringArray = ['car', 'carpet', 'cart'];
//   var givenStringArray = [
//     'apple',
//     'application',
//     'apply',
//     'appointment',
//     'appetite',
//     'appendix',
//   ];
  // var givenStringArray = ['flower','flow','flood'];

  // var result = findLongestCommonPrefix(givenStringArray);
  // print("LCP final: $result");

//   final testCases = [
//     ['flower', 'flow', 'flood', 'flour', 'flock', 'floating'],
//     [
//       'internet',
//       'internal',
//       'interval',
//       'interview',
//       'interact',
//       'interesting',
//     ],
//     ['prefix', 'prevent', 'preach', 'prepare', 'premium', 'press'],
//     [
//       'transport',
//       'transaction',
//       'transmission',
//       'translate',
//       'transfer',
//       'transform',
//     ],
//     ['apple', 'application', 'apply', 'appointment', 'appetite', 'appendix'],
//     ['apple', 'banana', 'cat', 'dog', 'elephant', 'fish'],
//     ['program', 'progress', 'project', 'promise', 'property', 'process'],
//     ['testing', 'tester', 'test', 'testimonial', 'testify', 'testament'],
//     ['flower', 'fl']
//   ];

//   for (int i = 0; i < testCases.length; i++) {
//     final words = testCases[i];
//     final result = findLongestCommonPrefix(words);

//     print('Test Case ${i + 1}');
//     print('Input : $words');
//     print('Output: "$result"');
//     print('----------------------------');
//   }


}


String findLongestCommonPrefix(List<String> stringArray) {
  if (stringArray.isEmpty) throw Exception("Array should not be empty");

  if (stringArray.length == 1) return stringArray.first;

  var lcp = stringArray.first ;

  for (int i = 1; i < stringArray.length; i++) {
    if (lcp.isEmpty) return "";

    var limit = lcp.length < stringArray[i].length
        ? lcp.length
        : stringArray[i].length;
    for (int j = 0; j < limit; j++) {
      
      if (lcp[j] != stringArray[i][j]) {
        lcp = lcp.substring(0, j);
        break;
      }

     
    }
     if(lcp.length>limit){
        lcp = lcp.substring(0,limit);
        break;
      }
  }
  return lcp;
}



List<int> twoSum(List<int> givenArray, int target) {
  var hashSet = {};

  for (int i = 0; i < givenArray.length; i++) {
    var req = target - givenArray[i];

    if (hashSet.containsKey(req)) {
      return [hashSet[req], i];
    }
    hashSet[givenArray[i]] = i;
  }
  return [0, 0];
}

List<int> moveZeros(List<int> givenArray) {
  emptyCheck(givenArray);

  int zeroIndex = 0;

  for (int i = 0; i < givenArray.length; i++) {
    int num = givenArray[i];

    if (num != 0) {
      var temp = givenArray[zeroIndex];
      givenArray[zeroIndex] = givenArray[i];

      givenArray[i] = temp;
      zeroIndex++;
    }
  }

  return givenArray;
}

List<int> rotateArrayAtK(List<int> givenArray, int k) {
  emptyCheck(givenArray);

  reverseArray(givenArray, 0, k);
  reverseArray(givenArray, k + 1, givenArray.length - 1);
  reverseArray(givenArray, 0, givenArray.length - 1);

  return givenArray;
}

void emptyCheck(List<int> givenArray) {
  if (givenArray.isEmpty) throw (Exception("Array should not be empty"));
}

List<int> reverseArray(List<int> givenArray, int start, int end) {
  while (start < end) {
    var temp = givenArray[start];
    givenArray[start] = givenArray[end];
    givenArray[end] = temp;

    start++;
    end--;
  }

  return givenArray;
}

List<int> removeDuplicates(List<int> givenArray) {
  emptyCheck(givenArray);

  return givenArray.toSet().toList();
}

int findSecondLargest(List<int> givenArray) {
  emptyCheck(givenArray);

  var firstLargest = givenArray[0];
  var secondLargest = givenArray[0];

  for (int i = 1; i < givenArray.length; i++) {
    int num = givenArray[i];
    if (firstLargest < num) {
      secondLargest = firstLargest;
      firstLargest = num;
    } else if (secondLargest < num) {
      secondLargest = num;
    }
  }

  return secondLargest;
}

int findMaximum(List<int> givenarray) {
  emptyCheck(givenarray);

  int max = givenarray[0];

  for (int i = 1; i < givenarray.length; i++) {
    if (max < givenarray[i]) max = givenarray[i];
  }

  return max;
}
