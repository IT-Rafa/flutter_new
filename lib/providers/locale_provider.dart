import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(const Locale('en'));
  // change locale
  void changeLocale(Locale newLocale) {
    state = newLocale;
  }
}
