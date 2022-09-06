import 'dart:math';

double normalize(val, max, min) { return (val - min) / (max - min); }

int randomNumber() {
  final Random random = Random();
  final int number = random.nextInt(100);
  return number;
}