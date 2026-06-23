# Left Rotate Array by K Positions - Reverse Algorithm (O(n))

## Problem Statement

Given an integer array and a value `k`, rotate the array towards the left by `k` positions.

### Example 1

Input:

```dart
array = [1,2,3,4,5,6,7,8,9,10]
k = 2
```

Output:

```text
[3,4,5,6,7,8,9,10,1,2]
```

---

### Example 2

Input:

```dart
array = [1,2,3,4,5,6,7,8,9,10]
k = 4
```

Output:

```text
[5,6,7,8,9,10,1,2,3,4]
```

---

# Brute Force Approach

Move the first element to the end `k` times.

Example:

```dart
for(int i=0;i<k;i++){
  int first = array.removeAt(0);
  array.add(first);
}
```

## Why this is not optimal?

Dart List internally works like a dynamic array.

When we call:

```dart
array.removeAt(0);
```

The first element is removed.

Example:

Before:

```text
Index: 0 1 2 3 4
Value: 1 2 3 4 5
```

Remove index 0:

```text
_ 2 3 4 5
```

Array cannot keep an empty space.

So every element shifts one position left:

```text
2 3 4 5
```

For an array of size `n`:

```
removeAt(0) = O(n)
```

The loop executes `k` times:

```
Total = k * n
```

Time Complexity:

```
O(k*n)
```

---

# Optimized Approach: Reverse Algorithm

Instead of moving elements one by one, we reverse parts of the array.

Steps:

1. Reverse first k elements
2. Reverse remaining elements
3. Reverse complete array

---

Example:

```text
array = [1,2,3,4,5,6,7,8,9,10]

k = 4
```

---

## Step 1

Reverse first k elements.

Reverse:

```text
[1,2,3,4]
```

Result:

```text
[4,3,2,1,5,6,7,8,9,10]
```

---

## Step 2

Reverse remaining elements.

Reverse:

```text
[5,6,7,8,9,10]
```

Result:

```text
[4,3,2,1,10,9,8,7,6,5]
```

---

## Step 3

Reverse complete array.

Result:

```text
[5,6,7,8,9,10,1,2,3,4]
```

Rotation completed.

---

# Dart Solution

```dart
void rotateLeft(List<int> array, int k){

  int n = array.length;

  k = k % n;

  reverse(array,0,k-1);

  reverse(array,k,n-1);

  reverse(array,0,n-1);
}


void reverse(List<int> array, int start, int end){

  while(start < end){

    int temp = array[start];

    array[start] = array[end];

    array[end] = temp;

    start++;

    end--;
  }
}


void main(){

  List<int> array = [
    1,2,3,4,5,6,7,8,9,10
  ];

  rotateLeft(array,4);

  print(array);
}
```

Output:

```text
[5,6,7,8,9,10,1,2,3,4]
```

---

# Why k % n?

If array size is:

```
n = 10
```

and:

```
k = 14
```

Rotating 10 times returns the original array.

So:

```
14 rotations
=
10 full rotations + 4 useful rotations
```

Formula:

```dart
k = k % n;
```

Example:

```text
14 % 10 = 4
```

Only 4 rotations are needed.

---

# Why Time Complexity is O(n)?

The algorithm calls reverse 3 times.

Reverse 1:

First k elements:

```
k / 2 swaps
```

Reverse 2:

Remaining elements:

```
(n-k) / 2 swaps
```

Reverse 3:

Whole array:

```
n / 2 swaps
```

Total:

```
k/2 + (n-k)/2 + n/2
```

First two parts:

```
(k+n-k)/2

= n/2
```

So:

```
n/2 + n/2

= n
```

Therefore:

```
Time Complexity = O(n)
```

---

# Space Complexity

No extra array is created.

Only one temporary variable is used:

```dart
int temp;
```

Memory usage does not grow with input size.

Therefore:

```
Space Complexity = O(1)
```

---

# Interview Explanation

Although we reverse the array three times, the first two reverses together process n elements and the final reverse processes n elements.

Total work is approximately:

```
2n operations
```

Big-O ignores constants:

```
O(2n) => O(n)
```

The solution is in-place and does not require extra memory.

Final Complexity:

Time: O(n)

Space: O(1)
