import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cat_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CatProvider(),
      child: MaterialApp(
        title: 'Cat Swiper',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 2,
            iconTheme: IconThemeData(color: Colors.black87),
            titleTextStyle: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
