import 'package:rearch/rearch.dart';

final container = CapsuleContainer();

void main(List<String> arguments) {
  print('Listener Issue -- Start');

  // ignore: unused_result
  container.listen((use) {
    final appState = use(appStateCapsule);

    print('Listener state --> ${appState.value}');

    Future.microtask(() {
      switch (appState.value) {
        case AppState.one:
          appState.value = AppState.two;

        case AppState.two:
          appState.value = AppState.three;

        case AppState.three:
          print('Final state --> 3');
      }
    });
  });

  print('Dart Issue -- End');
}

enum AppState {
  one,
  two,
  three,
}

ValueWrapper<AppState> appStateCapsule(CapsuleHandle use) =>
    use.data(AppState.one);
