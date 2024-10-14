import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor:
            Colors.white, // Set scaffold background color to white
        appBarTheme: const AppBarTheme(
          // Added AppBarTheme to set background color
          backgroundColor: Colors.white, // Set AppBar background color to white
          foregroundColor: Colors
              .black, // Optional: Set text/icon color to black for contrast
        ),
      ),
      home: const HomePage(),
    );
  }
}
