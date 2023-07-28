import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedLocaleNotifier extends StateNotifier<String> {
  SelectedLocaleNotifier() : super('en');

  void changeAppLanguage(String code) {
    state = code;
  }
}

final selectedLocaleProvider =
    StateNotifierProvider<SelectedLocaleNotifier, String>(
        (ref) => SelectedLocaleNotifier());
