// Given an array of numbers, return the duplicate values.
// Input:
//  [1,2,3,2,4,5,1]
// Output:
//  [2,1]

// Given an array of numbers, return the k most frequent elements.
// Input:
//  nums = [1,1,1,2,2,3], k = 2
// Output:
// [1, 2]

// You are given a list of time intervals [[start, end]].
// Merge all overlapping intervals and return the simplified list.
// Example Input:
//  [[1,3],[2,4],[6,8],[7,9]]
// Output:
// [[1,4],[6,9]]

// Given an unsorted array, return the smallest positive integer missing from the list.
// Input:
//  [3, 4, -1, 1]
// Output:
//  2

void main() {
  var givenList = [1, 2, 3, 2, 4, 5, 1, 8, 8];
  var response = returnDuplicates(givenList);
  print('response: $response');

  List<int> givenListTopkFrequent = [1, 1, 2, 2, 3, 3, 4, 4, 4, 5, 6, 6, 6, 6];
  ;
  int k = 2;
  var topkFrequentResponse = topkFrequent(givenListTopkFrequent, k);
  print('topkFrequentResponse: $topkFrequentResponse');

  List<List<int>> mergeOvelapArray = [
    [1, 3],
    [2, 4],
    [6, 8],
    [7, 9],
    [9, 10],
    [10, 11],
    [13, 14],
    [14, 15],
  ];
  // Output:
  // [[1,4],[6,9]]

  var overlappedArrayResult = mergeOverlap(mergeOvelapArray);

  print("overlappedArrayResult: ${overlappedArrayResult}");

  List<int> smallestPositiveIntegerArray = [3, 4, -1, 1, 2, 6, 9];
  // Output:
  //  5

  int smallestPositiveInteger = findSmallestPostiveInteger(
    smallestPositiveIntegerArray,
  );
  print("smallestPositiveInteger: $smallestPositiveInteger");
}

int findSmallestPostiveInteger(List<int> givenArray) {
  int resultInteger = 1;
  while (true) {
    if (!givenArray.contains(resultInteger)) return resultInteger;

    resultInteger++;
  }
}

List<List<int>> mergeOverlap(List<List<int>> givenArray) {
  List<List<int>> overlappedArray = [];

  for (List<int> current in givenArray) {
    if (overlappedArray.isEmpty || overlappedArray.last[1] < current[0]) {
      overlappedArray.add(current);
      continue;
    }

    overlappedArray.last[1] = current[1] > overlappedArray.last[1]
        ? current[1]
        : overlappedArray.last[1];
  }

  return overlappedArray;
}

List<int> returnDuplicates(List<int> givenList) {
  Set<int> visited = {};
  List<int> duplicates = [];

  for (int i = 0; i < givenList.length; i++) {
    if (visited.contains(givenList[i])) {
      duplicates.add(givenList[i]);
    } else {
      visited.add(givenList[i]);
    }
  }
  return duplicates;
}

List<int> topkFrequent(List<int> givenArray, int k) {
  Map<int, int> frequency = {};

  for (int num in givenArray) {
    frequency[num] = (frequency[num] ?? 0) + 1;
  }

  var entries = frequency.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return entries.take(k).map((e) => e.key).toList();
}
