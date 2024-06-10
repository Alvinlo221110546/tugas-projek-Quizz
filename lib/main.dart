import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/page/provider/DarkmodeProvider.dart';
import 'package:quizz/page/provider/TimerProvider.dart';
import 'package:quizz/page/provider/favouriteprovider.dart';
import 'package:quizz/page/provider/providerScore.dart';
import 'package:quizz/page/provider/providerUser.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProfileProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScoreProvider(),
      ),
      ChangeNotifierProvider(create: (context) => darkModeProvider()),
      ChangeNotifierProvider(create: (context) => TimerModel()),
      ChangeNotifierProvider(create: (context) => FavoriteModel())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<darkModeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SKILL UP',
      theme: prov.enableDarkMode == true ? prov.dark : prov.light,
      home: const LoginPage(),
    );
  }
}
