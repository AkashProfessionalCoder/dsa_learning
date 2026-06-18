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
  // var givenList = [1, 2, 3, 2, 4, 5, 1];
  // var response = returnDuplicates(givenList);
  //  print('response: $response');

  //  List<int> givenList = [1, 1, 1, 2, 2, 3];
  //  int k = 2;
  // var response = mostFrequentValues(givenList, k);
  // print('response: $response');

  var givenList = [
    [1, 3],
    [2, 4],
    [6, 8],
    [7, 9],
  ];

  List<int> expandedList = [];

  for (int i = 0; i < givenList.length; i++) {
    List<int> intList = givenList[i];

    var start = intList[0];
    var last = intList.last;

    var stop = 0;

    while (last >= start && stop < 5) {
      expandedList.add(start);
      start++;
      stop++;
    }

    //     print("current expanded list: $expandedList");
  }

  print("current expanded list: $expandedList");

  var toSetList = expandedList.toSet().toList();
  print("tosetlist: $toSetList");

  List<List<int>> response = [];

  var tempStart = toSetList[0];

  for (int i = 0; i < toSetList.length; i++) {
    int currentItem = toSetList[i];

    if (!toSetList.contains(currentItem + 1)) {
      response.add([tempStart, currentItem]);

      if (i < toSetList.length - 1) {
        tempStart = toSetList[i + 1];
      }
    }
  }

  print('final response: $response');
}

List<int> mostFrequentValues(List<int> givenList, int k) {
  return _getMulipleTimeValues(givenList, k);
}

List<int> returnDuplicates(List<int> givenList) {
  return _getMulipleTimeValues(givenList, 2);
}

// helper method
List<int> _getMulipleTimeValues(List<int> givenList, int times) {
  Map<int, int> hash = {};
  List<int> response = [];

  for (int i = 0; i < givenList.length; i++) {
    hash[givenList[i]] = (hash[givenList[i]] ?? 0) + 1;
  }

  for (final entry in hash.entries) {
    if (entry.value >= times) {
      response.add(entry.key);
    }
  }

  return response;
}
