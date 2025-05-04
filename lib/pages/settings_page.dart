import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/generated/easy/locale_keys.g.dart';
import 'package:flutter_new/providers/locale_provider.dart';
import 'package:flutter_new/providers/theme_mode_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.SETTINGS_title.tr())),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref
                    .read(localeProvider.notifier)
                    .changeLocale(const Locale('en'));
                context.setLocale(const Locale('en'));
              },
              child: Text(LocaleKeys.SETTINGS_english.tr()),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(localeProvider.notifier)
                    .changeLocale(const Locale('es'));
                context.setLocale(const Locale('es'));
              },
              child: Text(LocaleKeys.SETTINGS_spanish.tr()),
            ),
            ElevatedButton(
              onPressed: () {
                List<String> local = Platform.localeName.split("_");
                if (local.length == 2) {
                  if (context.supportedLocales.contains(
                    Locale(local[0], local[1]),
                  )) {
                    ref
                        .read(localeProvider.notifier)
                        .changeLocale(Locale(local[0], local[1]));
                    context.setLocale(Locale(local[0], local[1]));
                  } else {
                    ref
                        .read(localeProvider.notifier)
                        .changeLocale(Locale(local[0]));
                    context.setLocale(Locale(local[0]));
                  }
                } else {
                  ref
                      .read(localeProvider.notifier)
                      .changeLocale(Locale(local[0]));
                  context.setLocale(Locale(local[0]));
                }
              },
              child: Text(LocaleKeys.SETTINGS_system_language.tr()),
            ),

            SizedBox(height: 20),

            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(themeModeProvider.notifier).state = ThemeMode.dark;
                  },
                  child: Text(LocaleKeys.SETTINGS_dark_mode.tr()),
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(themeModeProvider.notifier).state =
                        ThemeMode.light;
                  },
                  child: Text(LocaleKeys.SETTINGS_light_mode.tr()),
                );
              },
            ),
                        Consumer(
              builder: (context, ref, child) {
                return ElevatedButton(
                  onPressed: () {
                    ref.read(themeModeProvider.notifier).state =
                        ThemeMode.system;
                  },
                  child: Text(LocaleKeys.SETTINGS_system_mode.tr()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
