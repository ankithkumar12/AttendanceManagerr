import 'package:attendace/screens/main_screen.dart';
import 'package:flutter/material.dart';

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 27, 10, 52),
);

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 111, 95, 214));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
        ),
       home: const Attendance(),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
         cardTheme: const CardTheme().copyWith(
           color: kDarkColorScheme.secondaryContainer,
         ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),

        
       
      ),
    ),
  );
}

class Attendance extends StatelessWidget {
  const Attendance({super.key});
  @override
  Widget build(BuildContext context) {
    return const MainScreen();
  }
}
