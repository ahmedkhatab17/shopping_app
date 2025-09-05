import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shopping_app/screens/home_screen.dart';
import 'package:flutter_shopping_app/screens/signin_screen.dart';
import 'package:flutter_shopping_app/screens/signup_screen.dart';
import 'package:flutter_shopping_app/screens/welcome_screen.dart';
import 'package:flutter_shopping_app/utils/fade_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale currentLocale = const Locale('en', '');

  void changeLanguage(Locale locale) {
    setState(() {
      currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Store',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Suwannaphum'),
      locale: currentLocale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', ''), Locale('ar', '')],
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/signup':
            page = SignUpScreen(onLanguageChanged: changeLanguage);
            break;
          case '/signin':
            page = SignInScreen(onLanguageChanged: changeLanguage);
            break;
          case '/home':
            page = HomeScreen(onLanguageChanged: changeLanguage);
            break;
          default:
            page = WelcomeScreen(onLanguageChanged: changeLanguage);
        }
        return FadeRoute(page: page);
      },
    );
  }
}
