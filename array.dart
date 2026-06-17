void main() {
  // find the largest number
  // findLargestNumber();

  // Second largest number
  // secondLargestMethod();

  // Two Sum
  // var value = twoSum([2, 7, 11, 15], 9);
  // print("two sum value: ${value}");
  // twoSum([3, 2, 4], 6);
  // twoSum([3, 3], 6);
  // twoSum([-1, -2, -3, -4, -5], -8);
  // twoSum([0, 3, -3, 4, -1], -1);

  // ReverseArray
  // reverseArray([1, 2, 3, 4, 5]);

  // Remove Duplicates
  // removeDuplicates([2,3,4,5,5,3,8,0,1,-1,-3,-1]);

  // Zero To End
  // zeroToEnd([1,3,5,0,9,0,2,0,9,0,8,0]);

  var leftTree = Tree("Aathi", null, null);
  var rightTree = Tree("Aadhanya", null, null);

  var newTree = Tree("Akash", leftTree, rightTree);

  print("Tree: ${newTree.name}");
  print("left tree: ${newTree.left?.name}");
  print("right Tree: ${newTree.right?.name}");
}

List<int> twoSum(List<int> nums, int target) {
  Map<int, int> hashMap = {};

  for (int i = 0; i < nums.length; i++) {
    var required = target - nums[i];

    if (hashMap.containsKey(required)) {
      return [hashMap[required]!, i];
    }

    hashMap[nums[i]] = i;
  }

  return [];
}

List<int> zeroToEnd(List<int> nums) {
  var zeroIndex = 0;

  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      var temp = nums[i];

      nums[i] = nums[zeroIndex];

      nums[zeroIndex] = temp;

      zeroIndex++;
    }
  }

  print("ZeroToEnd nums: $nums");

  return nums;
}

List<int> removeDuplicates(List<int> nums) {
  Map<int, bool> seen = {};
  List<int> results = <int>[];

  for (int i = 0; i < nums.length; i++) {
    if (!seen.containsKey(nums[i])) {
      results.add(nums[i]);

      seen[nums[i]] = true;
    }
  }
  print("removeDuplicates results: ${results}");
  return results;
}

List<int> reverseArray(List<int> nums) {
  var start = 0;
  var end = nums.length - 1;

  while (start < end) {
    var temp = nums[start];
    nums[start] = nums[end];
    nums[end] = temp;

    start++;
    end--;
  }
  print("nums: $nums");

  return nums;
}

List<int> twoSumMine(List<int> nums, int target) {
  var twoSumIndices = <int>[];

  for (int i = 0; i < nums.length; i++) {
    var firstnum = nums[i];
    int remains = 0;

    remains = firstnum - target;

    var secondNumIndex = nums.lastIndexOf(remains);

    if (i == secondNumIndex || secondNumIndex == -1) {
      if (remains.isNegative) {
        remains = remains.abs();
      } else {
        remains = remains * -1;
      }

      secondNumIndex = nums.lastIndexOf(remains);

      if (i == secondNumIndex || secondNumIndex == -1) continue;
    }

    twoSumIndices = [i, secondNumIndex];
    break;
  }
  print("twoSumIndices: $twoSumIndices");
  return twoSumIndices;
}

void secondLargestMethod() {
  final list = [4, 3, 8, 17, 3, 5, 1];

  var firsLargestNumber = list[0];
  int secondLargestNumber = firsLargestNumber;

  // f =20
  // s =10

  // 15

  for (int i = 1; i < list.length; i++) {
    if (firsLargestNumber < list[i]) {
      secondLargestNumber = firsLargestNumber;
      firsLargestNumber = list[i];
    } else if (secondLargestNumber < list[i]) {
      secondLargestNumber = list[i];
    }
  }

  print("secondLargestNumber : ${secondLargestNumber}");
}

void findLargestNumber() {
  final list = [4, 3, 8, 7, 3, 5, 1];

  var max = list[0];

  for (int i = 1; i < list.length; i++) {
    if (max < list[i]) {
      max = list[i];
    }
  }

  print("max: $max");
}

class Tree {
  Tree(this.name, this.left, this.right);

  final String name;

  final Tree? left;
  final Tree? right;
}
