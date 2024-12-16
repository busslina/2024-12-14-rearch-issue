import 'package:rearch/rearch.dart';

final container = CapsuleContainer();

main() {
  print('Starting counter boot test');
  container.read(counterBootCapsule);
}

void counterBootCapsule(CapsuleHandle use) {
  final counter = use.data(0);

  final currentValue = counter.value;

  // Not changed
  if (use.previous(currentValue) == currentValue) {
    print('Weird: not changed');
    return;
  }

  print('Counter: $currentValue');

  Future.delayed(const Duration(seconds: 1), () => counter.value++);
}
