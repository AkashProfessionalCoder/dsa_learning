# DSA Interview Problems - Dart Solutions

Collection of commonly asked DSA problems in Flutter/Dart developer interviews with optimized solutions.

---

# 1. First Missing Positive Integer

## Problem

Given an unsorted integer array, return the smallest positive integer missing from the array.

## Example

### Input

```dart
[3, 4, -1, 1]
```

### Output

```text
2
```

### Explanation

```
Positive integers:

1 -> exists
2 -> missing

Answer = 2
```

---

## Approach

Use a HashSet for fast lookup.

Steps:

1. Convert list into Set.
2. Start checking numbers from 1.
3. First number not available in Set is the answer.

---

## Dart Solution

```dart
int firstMissingPositive(List<int> nums) {

  Set<int> values = nums.toSet();

  int missing = 1;


  while(true){

    if(!values.contains(missing)){
      return missing;
    }

    missing++;
  }
}



void main(){

  List<int> nums = [3,4,-1,1];

  print(
    firstMissingPositive(nums)
  );

}
```

---

## Complexity

```
Time Complexity  : O(n)

Space Complexity : O(n)
```

---

<br>

# 2. Top K Frequent Elements

## Problem

Given an integer array, return the `k` most frequent elements.

---

## Example

### Input

```dart
nums = [1,1,1,2,2,3]

k = 2
```

### Output

```text
[1,2]
```

---

## Explanation

Frequency:

```
1 -> 3 times

2 -> 2 times

3 -> 1 time
```

Top 2 frequent elements:

```
[1,2]
```

---

## Approach

Use HashMap + Sorting.

Steps:

1. Store frequency count in Map.
2. Sort entries based on frequency.
3. Return first K elements.

---

## Dart Solution


```dart
List<int> topKFrequent(
    List<int> nums,
    int k
){

  Map<int,int> frequency = {};


  for(final number in nums){

    frequency[number] =
        (frequency[number] ?? 0) + 1;

  }


  var entries =
      frequency.entries.toList();



  entries.sort(
    (a,b)=>
        b.value.compareTo(a.value)
  );


  return entries
      .take(k)
      .map((e)=>e.key)
      .toList();

}



void main(){

  List<int> nums =
      [1,1,1,2,2,3];


  print(
    topKFrequent(nums,2)
  );

}
```

---

## Complexity


```
Frequency Count : O(n)

Sorting          : O(n log n)


Total:

Time Complexity  : O(n log n)

Space Complexity : O(n)
```

---

<br>


# 3. Find Duplicate Values

## Problem

Given an array of integers, return all duplicate values.


---

## Example


### Input

```dart
[1,2,3,2,4,5,1]
```


### Output


```text
[2,1]
```

---

## Approach

Use Set.

Steps:

1. Keep visited numbers in Set.
2. If number already exists, it is duplicate.
3. Add it into result.


---

## Dart Solution


```dart
List<int> findDuplicates(
    List<int> nums
){

  Set<int> visited = {};

  List<int> duplicates = [];


  for(final number in nums){


    if(
      visited.contains(number)
    ){

      duplicates.add(number);

    }
    else{

      visited.add(number);

    }

  }


  return duplicates;

}



void main(){

  List<int> nums =
      [1,2,3,2,4,5,1];


  print(
    findDuplicates(nums)
  );

}
```


---

## Complexity


```
Time Complexity  : O(n)

Space Complexity : O(n)
```

---

<br>


# 4. Merge Overlapping Intervals


## Problem


Given a list of intervals `[start,end]`, merge all overlapping intervals.


---


## Example


### Input


```dart
[
 [1,3],
 [2,4],
 [6,8],
 [7,9]
]
```


### Output


```dart
[
 [1,4],
 [6,9]
]
```


---

## Explanation


Before:


```
[1,3]

[2,4]
```


Check:


```
current start <= previous end


2 <= 3
```


So merge:


```
[1,4]
```


---

## Approach


Use Sorting + Previous Interval comparison.


Steps:


1. Sort intervals by start value.
2. Compare current start with previous end.
3. If overlap, update end value.
4. Otherwise add new interval.


---

## Dart Solution


```dart
List<List<int>> mergeIntervals(
    List<List<int>> intervals
){


  if(intervals.isEmpty){

    return [];

  }


  intervals.sort(
    (a,b)=>a[0].compareTo(b[0])
  );



  List<List<int>> result=[];



  for(final current in intervals){


    if(
      result.isEmpty ||
      result.last[1] < current[0]
    ){


      result.add(current);


    }
    else{


      result.last[1] =
          result.last[1] > current[1]
          ? result.last[1]
          : current[1];


    }

  }



  return result;

}



void main(){


var intervals = [

 [1,3],
 [2,4],
 [6,8],
 [7,9]

];


print(
 mergeIntervals(intervals)
);


}
```


---

## Complexity


```
Sorting : O(n log n)

Loop    : O(n)


Total:


Time Complexity  : O(n log n)

Space Complexity : O(n)
```

---

# Pattern Summary


| Problem | Pattern | Time |
|---|---|---|
| Duplicate Values | HashSet | O(n) |
| Frequency Count | HashMap + Sort | O(n log n) |
| Missing Positive | HashSet Lookup | O(n) |
| Merge Intervals | Sort + Compare Previous | O(n log n) |


---

# Important DSA Patterns For Flutter Developers


```
Array Search
    |
    ---> Set


Counting / Frequency
    |
    ---> HashMap


Ranking / Top K
    |
    ---> HashMap + Sorting / Heap


Intervals
    |
    ---> Sort + Compare Previous


Duplicate Detection
    |
    ---> Set / HashMap
```