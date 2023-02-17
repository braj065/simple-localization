# 📌 **Showcase**

<img src = "https://user-images.githubusercontent.com/55150540/169638060-54328d0e-54df-45c5-a914-71b31e153989.gif" width = 200>


<br>
<br>

# 📌 **Installation**

### ✔️ (`pubspec.yaml`)

```yaml
dependencies:
  easy_localization: ^3.0.0 # 현지화
  flutter_phoenix: ^1.0.0  # 앱 재시작

flutter:
  assets:
   - assets/langs/
  
```
<br>

### ✔️ assets
```
assets
└── langs
    ├── es.json                  
    └── en.json
```

<br>

### ✔️ iOS

- `ios/Runner/Info.plist`

```swift
<key>CFBundleLocalizations</key>
<array>
   <string>en</string>
   <string>ko</string>
</array>
```

<br>
<br>

# 📌  Example



```dart
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:localization_example/screens/home_screen.dart';
import 'package:localization_example/widgets/language_button.dart';

import 'constants.dart';

void main() async {
  // main
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    Phoenix(
      child: EasyLocalization(
        supportedLocales: const [en, ko], 
        path: 'assets/langs', 
        fallbackLocale: en, 
        child: const MyApp(), 
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeScreen(),
    );
  }
}

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
              text: '한국어',
              locale: ko,
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

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.text,
    required this.locale,
  }) : super(key: key);

  final String text;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        await context.setLocale(locale);
        await EasyLocalization.ensureInitialized();
        Phoenix.rebirth(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Text(text),
      ),
    );
  }
}
```

<br>

### ✔️ locale

```dart
await context.setLocale(locale);
```

<br>

### ✔️  (`tr()`)

- ../en.json
```json
{
  "appBar" : "Simple Example"
}

```

- ../es.json

```json
{
  "appBar" : "Ejemplo sencillo"
}
```

```dart
// en : Localization Example
// ko : Localization 예제
const Text('appBar').tr(),
```

<br>

### ✔️ 

```dart
Phoenix.rebirth(context);
```
