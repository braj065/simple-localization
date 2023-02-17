import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/language_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Locale : ${context.locale}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('appBar').tr(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            LanguageButton(
              text: 'Español',
              locale: es,
            ),
            SizedBox(height: 12),
            LanguageButton(
              text: 'English',
              locale: en,
            ),
          ],
        ),
      ),
    );
  }
}
