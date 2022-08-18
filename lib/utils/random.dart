import 'dart:math';

List<int> randomIntegerList({int len = 1, int max = 120, int min = 1}) {
  if (len > max || len < min) {
    return [];
  }

  List<int> newList = [];
  Random rand = Random();
  int count = 1;

  while (count <= len) {
    int val = rand.nextInt(max);
    if (newList.contains(val)) {
      continue;
    } else {
      newList.add(val);
      count++;
    }
  }

  return newList;
}
