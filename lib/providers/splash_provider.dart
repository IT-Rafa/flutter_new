import 'package:hooks_riverpod/hooks_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, bool>((ref) {
  return SplashNotifier();
});


class SplashNotifier extends StateNotifier<bool> {
  SplashNotifier() : super(false);

  // Show splash screen
  void showSplash() {
    state = true;
  }

  // Hide splash screen
  void hideSplash() {
    state = false;
  }
}
