import 'package:rearch/rearch.dart';

final container = CapsuleContainer();

void main(List<String> arguments) {
  print('Listener Issue -- Start');

  container.read(listenAppStateCapsule);

  print('Listener Issue -- End');
}

enum AppState {
  one,
  two,
  three,
}

ValueWrapper<AppState> appStateCapsule(CapsuleHandle use) =>
    use.data(AppState.one);

void listenAppStateCapsule(CapsuleHandle use) {
  use.asListener();

  final appState = use(appStateCapsule);

  print('App state --> ${appState.value}');

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
}
