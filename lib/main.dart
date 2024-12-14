import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pages
import 'package:movie_app/pages/splash.dart';
import 'package:movie_app/pages/main_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      OnInitializationComplete: () => runApp(
        ProviderScope(
          child: Movie(),
        ),
      ),
    ),
  );
}

class Movie extends StatelessWidget {
  const Movie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext _context) => MainPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
