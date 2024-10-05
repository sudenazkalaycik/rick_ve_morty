import 'package:flutter/material.dart';
import 'package:rick_and_morty_universe/navigation/widgets/app_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rick and Morty'nin Dünyası",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppNavigator(),
      debugShowCheckedModeBanner: false,
    );
  }
}