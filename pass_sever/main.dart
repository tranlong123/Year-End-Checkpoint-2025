final BigInt MOD = BigInt.from(1000000007);

void main() {
  List<BigInt> tests = [
    BigInt.from(1),
    BigInt.from(2),
    BigInt.from(3),
    BigInt.from(10),
    BigInt.from(1000),
    BigInt.from(1000000000000000000),
  ];

  for (var tc in tests) {
    final result = countPasswords(tc);
    final bool isModded = tc >= BigInt.from(15);

    if (isModded) {
      print("N = $tc  →  $result (mod $MOD)");
    } else {
      print("N = $tc  →  $result");
    }
  }
}

// 5^⌈N/2⌉*4^⌊N/2⌋
BigInt countPasswords(BigInt input) {
  final BigInt one = BigInt.one;
  final BigInt two = BigInt.from(2);

  final BigInt odd = (input + one) ~/ two;
  final BigInt even = input ~/ two;

  final BigInt p5 = BigInt.from(5).modPow(odd, MOD);
  final BigInt p4 = BigInt.from(4).modPow(even, MOD);

  return (p5 * p4) % MOD;
}
