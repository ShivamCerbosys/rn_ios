import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LangNotifier extends StateNotifier<Locale> {
  LangNotifier() : super(const Locale("en"));

  void changeLang() {
    if (state == const Locale("en")) {
      state = const Locale("hi");
    } else {
      state = const Locale("en");
    }
  }
}

final langChangeProvider = StateNotifierProvider<LangNotifier, Locale>((ref) {
  return LangNotifier();
});
