import 'dart:math';

double normalize(val, max, min) { return (val - min) / (max - min); }

int randomNumber() {
  Random random = Random();
  int number = random.nextInt(100);
  return number;
}