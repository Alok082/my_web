import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //text style
  // static TextStyle headings = const TextStyle(
  //   fontSize: 24,
  //   fontWeight: FontWeight.bold,
  //   color: Colors.white,
  // );

  // static const TextStyle descriptive = TextStyle(
  //   fontSize: 19,
  //   color: Colors.white,
  // );

  static TextStyle appNameTitle = GoogleFonts.firaCode(
    fontSize: 54,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 3.0,
        color: Colors.white.withOpacity(0.2), // Adjust opacity for subtlety
        offset: const Offset(1.0, 1.0), // Adjust offset for shadow direction
      ),
    ],
  );
  static TextStyle appHeading = GoogleFonts.ptSerif(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 3.0,
        color: Colors.white.withOpacity(0.2), // Adjust opacity for subtlety
        offset: const Offset(1.0, 1.0), // Adjust offset for shadow direction
      ),
    ],
  );

  static TextStyle mediumText = GoogleFonts.ptSerif(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 1.0,
        color: Colors.white.withOpacity(0.15),
        offset: const Offset(0.5, 0.5),
      ),
    ],
  );

  static TextStyle headline1 = GoogleFonts.ptSerif(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle headline2 = GoogleFonts.firaCode(
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle headline3 = GoogleFonts.ptSerif(
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle headline4 = GoogleFonts.ptSerif(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle headline5 = GoogleFonts.ptSerif(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle linkText = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  static TextStyle errorText = const TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );

  static TextStyle bodyText1 = GoogleFonts.firaCode(
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle bodyText2 = GoogleFonts.firaCode(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle captionText = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: Colors.white38,
  );

  // most used text color
  static const Color mostusedtextcolor = Color.fromARGB(239, 255, 0, 0);

  //  most used container color
  static const Color mostusedcontainer = Color.fromARGB(255, 255, 226, 226);
  // fields border color
  static const Color textfield_border_color =
      Color.fromARGB(255, 222, 222, 222);

  // Define primary and accent colors
  static const Color primaryColor = Color.fromARGB(
    255,
    72,
    163,
    198,
  );

  static const Color accentColor = Colors.green;

  // Define background colors
  static const Color backgroundColor = Colors.white;

  // Define text colors
  static const Color textColor = Colors.white;
  static const Color subtitleColor = Colors.grey;
// ride page past ride upccoming ride card back ground color

  static const Color textcolor = Color.fromARGB(102, 0, 0, 0);

  // Add more color definitions as needed

  // Define light theme
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primaryColor,
      hintColor: accentColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
        titleMedium: TextStyle(color: subtitleColor),
        titleSmall: TextStyle(color: subtitleColor),
        // Add more text styles as needed
      ),
      // Add more theme properties as needed
    );
  }

  // Define dark theme
  // static ThemeData darkTheme() {
  //   return ThemeData.dark().copyWith(
  //       // Customize dark theme properties
  //       );
  // }
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 196, 16, 16),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color.fromARGB(255, 240, 212, 212),
  onPrimaryContainer: Color(0xFF001F24),
  secondary: Color(0xFFBE0034),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDADA),
  onSecondaryContainer: Color(0xFF40000B),
  tertiary: Color(0xFFB81D27),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color.fromARGB(255, 240, 212, 212),
  onTertiaryContainer: Color(0xFF410005),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFD),
  onBackground: Color(0xFF191C1D),
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFDBE4E6),
  onSurfaceVariant: Color(0xFF3F484A),
  outline: Color(0xFF6F797A),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFF4FD8EB),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006874),
  outlineVariant: Color(0xFFBFC8CA),
  scrim: Color(0xFF000000),
);

// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFF4FD8EB),
//   onPrimary: Color(0xFF00363D),
//   primaryContainer: Color(0xFF004F58),
//   onPrimaryContainer: Color(0xFF97F0FF),
//   secondary: Color(0xFFFFB3B5),
//   onSecondary: Color(0xFF680018),
//   secondaryContainer: Color(0xFF920026),
//   onSecondaryContainer: Color(0xFFFFDADA),
//   tertiary: Color(0xFFFFB3AE),
//   onTertiary: Color(0xFF68000C),
//   tertiaryContainer: Color(0xFF930015),
//   onTertiaryContainer: Color(0xFFFFDAD7),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Color(0xFF191C1D),
//   onBackground: Color(0xFFE1E3E3),
//   surface: Color(0xFF191C1D),
//   onSurface: Color(0xFFE1E3E3),
//   surfaceVariant: Color(0xFF3F484A),
//   onSurfaceVariant: Color(0xFFBFC8CA),
//   outline: Color(0xFF899294),
//   onInverseSurface: Color(0xFF191C1D),
//   inverseSurface: Color(0xFFE1E3E3),
//   inversePrimary: Color(0xFF006874),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFF4FD8EB),
//   outlineVariant: Color(0xFF3F484A),
//   scrim: Color(0xFF000000),
// );
