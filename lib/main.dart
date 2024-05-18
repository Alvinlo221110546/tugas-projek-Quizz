
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/page/LoginPage.dart';
import 'package:quizz/provider/DarkmodeProvider.dart';
import 'package:quizz/provider/TimerProvider.dart';
import 'package:quizz/provider/providerUser.dart';

void main() {
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
            create: (context) => ProfileProvider(),
          ), ChangeNotifierProvider(create: (context)=>darkModeProvider()),ChangeNotifierProvider(create: (context)=>TimerModel())
  ],child: const MyApp(),));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<darkModeProvider>(context);
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: prov.enableDarkMode == true ? prov.dark : prov.light,
          home: const LoginPage(),
        );
  }
}
