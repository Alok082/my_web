import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.ptSerif(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.black
                    .withOpacity(0.2), // Adjust opacity for subtlety
                offset: const Offset(
                    1.0, 1.0), // Adjust offset for shadow direction
              ),
            ],
          ),
          // ···
          titleLarge: GoogleFonts.ptSerif(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 1.0,
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(0.5, 0.5),
              ),
            ],
          ),
          bodyMedium: GoogleFonts.roboto(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
          displaySmall: GoogleFonts.roboto(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
