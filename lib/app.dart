import 'package:aga_calculator/components/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavor;
  const App({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    String title = "Gaharuzo";
    switch (flavor) {
      case "development":
        title = "Gaharuzo Dev";
        break;
      case "staging":
        title = "Gaharuzo Stage";
        break;
      case "production":
        title = "Gaharuzo";
        break;
      default:
        title = "Gaharuzo";
    }

    return MaterialApp(
      title: 'Aga Calculatrice',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(title: title),
    );
  }
}
