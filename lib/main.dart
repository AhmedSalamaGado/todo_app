import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo/my_theme_data.dart';

import 'ui/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mythemedata.lightmode,
      darkTheme: mythemedata.darkMode,
      themeMode: ThemeMode.system,
      localizationsDelegates: const[
       // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales:const [
        Locale("en"),
        Locale("ar")
      ],
      locale: Locale("en"),
      routes: {
        Home.routeName:(_)=>Home(),
      },
      initialRoute: Home.routeName,

    );
  }
}

