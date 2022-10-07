import 'dart:math';

int clamp(int number, int low, int up) {
  return min(up, max(number, low));
}
