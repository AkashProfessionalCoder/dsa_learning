void main() {
  var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var val = 4;
  //output = [3,4,5,6,7,8,9,10,1,2]

  // if val = 4
  // then the output will be [5,6,7,8,9,10,1,2,3,4]

  var array2 = [11, 22, 33, 44, 55, 66, 77, 88, 98, 100];
  var val2 = 44;

  // then the output will be. [ 55, 66, 77, 88, 98, 100, 11, 22, 33, 44]

  var array3 = [3, 5, 7, 11, 6, 89, 23, 52, 77, 100];
  var val3 = 23;

  // then the output will be. [52, 77, 100,3, 5, 7, 11, 6, 89, 23]

  rotateLeft(array, val);
  rotateLeft(array2, val2);
  rotateLeft(array3, val3);

  print("array: $array");
  print("array2: $array2");
  print("array3: $array3");
}

void rotateLeft(List<int> array, int k) {
  var index = array.indexOf(k);
 
  if (index == -1) return;
 
  var n = array.length;

  reverseArray(array, 0, index);
  reverseArray(array, index+1, n-1);

  reverseArray(array, 0, n-1);
}

void reverseArray(List array, int start, int end) {
  while (start < end) {
    var temp = array[start];

    array[start] = array[end];

    array[end] = temp;

    start++;
    end--;
  }
}
