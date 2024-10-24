import 'package:nurse_department/resource/resource.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ResponsiveProvider(context),
        ),
      ],
      child: const MyWebsite(),
    ),
  );
}

class MyWebsite extends StatelessWidget {
  const MyWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Andong National University',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      // home: const HomePage(),
    );
  }
}
