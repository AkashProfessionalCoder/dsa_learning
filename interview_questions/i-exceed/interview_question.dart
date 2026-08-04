void main() {
  var givenArray = [1, 2, 3, 4,5, 6, 7, 8,10];
  var missingNumber = findMissingNumber(givenArray);
  print("missing number: $missingNumber");
}

int findMissingNumber(List<int> givenArray) {
  var n = givenArray.last;
  var expectedSum = ((n * (n + 1)) / 2).toInt();

  var actualSum = givenArray.fold(0, (sum, e) => sum += e);
 
  return expectedSum - actualSum;
}
