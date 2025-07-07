import 'package:flutter_test/flutter_test.dart';
import 'package:programming_challenge/logic/primeLogic.dart';

void main() {
  group('PrimeLogic.isPrime', () {
    test('returns false for numbers less than 2', () {
      expect(PrimeLogic.isPrime(0), false);
      expect(PrimeLogic.isPrime(1), false);
    });

    test('returns true for known prime numbers', () {
      expect(PrimeLogic.isPrime(2), true);
      expect(PrimeLogic.isPrime(3), true);
      expect(PrimeLogic.isPrime(5), true);
      expect(PrimeLogic.isPrime(11), true);
      expect(PrimeLogic.isPrime(17), true);
    });

    test('returns false for non-prime numbers', () {
      expect(PrimeLogic.isPrime(4), false);
      expect(PrimeLogic.isPrime(6), false);
      expect(PrimeLogic.isPrime(9), false);
      expect(PrimeLogic.isPrime(15), false);
    });
  });
}
