import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/providers/locale_provider.dart';
import 'package:flutter_new/providers/theme_mode_provider.dart';
import 'package:flutter_new/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    /// [MyApp] is wrapped in a [ProviderScope].
    /// This widget is where the state of most of our providers will be stored.
    /// This replaces `MultiProvider` if you've used `provider` before.
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('es')],
        path: 'assets/langs',
        fallbackLocale: Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        child: MyApp(),
      ),
    ),
  );
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// [appRouterProvider] is a Riverpod provider that holds the app's router (routes and navigation logic)
    final router = ref.watch(appRouterProvider);

    /// [localeProvider] is a Riverpod provider that holds the current locale.
    final appLocale = ref.watch(localeProvider);

    /// [themeModeProvider] is a Riverpod provider that holds the current theme mode.
    final themeMode = ref.watch(themeModeProvider);

    /// [MaterialApp] is the root widget of the app.
    ///
    return MaterialApp.router(
      title: "Flutter Demo",

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode, // Use themeMode from Riverpod provider.

      routerConfig: router,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: appLocale, // Use locale from Riverpod provider.
    );
  }
}
