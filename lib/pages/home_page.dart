import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/generated/easy/locale_keys.g.dart';

import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.HOME_title.tr())),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/settings'),
          child: Text(LocaleKeys.HOME_go_to_settings.tr()),
        ),
      ),
    );
  }
}
