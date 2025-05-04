import 'package:flutter_new/pages/home_page.dart';
import 'package:flutter_new/pages/settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/settings', builder: (context, state) => SettingsPage()),
    ],
  );
});
