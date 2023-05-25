import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultThemeData {
  static ThemeData defaultTheme(AppThemeData themeData) {
    return ThemeData(
      textTheme: textTheme(themeData),
      primaryColor: themeData.primary1,
      scaffoldBackgroundColor: themeData.justWhite,
      iconTheme: IconThemeData(color: themeData.primary4Grey),
      dividerColor: themeData.offWhite,
      textSelectionTheme:
          TextSelectionThemeData(cursorColor: themeData.primary1),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: themeData.primary4Grey),
        systemOverlayStyle: themeData.overlayStyle,
        titleTextStyle: textTheme(themeData).displaySmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromHeight(56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 0.0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: themeData.primary1,
        secondary: themeData.secondary,
      ),
      dialogBackgroundColor: themeData.justWhite,
      cardColor: themeData.justWhite,
    );
  }

  static TextTheme textTheme(AppThemeData themeData) {
    return TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 39.0,
          height: 1.28,
          color: themeData.darkest),
      displayMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 31.0,
          height: 1.3,
          color: themeData.darkest),
      displaySmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 25.0,
          height: 1.2,
          color: themeData.darkest),
      headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
          height: 1.25,
          color: themeData.darkest),
      headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 16.0,
          height: 1.25,
          color: themeData.darkest),
      titleLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
          height: 1.2,
          color: themeData.darkest),
      bodyLarge: GoogleFonts.sen(
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
          height: 1.25,
          color: themeData.darkest),
      bodyMedium: GoogleFonts.sen(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          height: 1.15,
          color: themeData.darkest),
      bodySmall: GoogleFonts.sen(
          fontWeight: FontWeight.w400,
          fontSize: 12.0,
          height: 1.33,
          color: themeData.darkest),
    );
  }
}

class AppTheme extends InheritedWidget {
  const AppTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final AppThemeData data;

  static AppThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    if (theme != null) {
      return theme.data;
    } else {
      throw Error();
    }
  }

  @override
  bool updateShouldNotify(AppTheme oldWidget) => data != oldWidget.data;
}

class AppThemeData {
  final Color alert;
  final Color dark;
  final Color darkest;
  final Color disabledText;
  final Color green;
  final Color justWhite;
  final Color justWhiteText;
  final Color lightBackground;
  final Color lightBackgroundDisabled;
  final Color lightest;
  final Color medium;
  final Color offWhite;
  final Color primary1;
  final Color primary2;
  final Color primary2Grey;
  final Color primary4;
  final Color primary4Grey;
  final Color primary4White;
  final Color secondary;
  final Color shadow;
  final Color warning;
  final SystemUiOverlayStyle overlayStyle;
  final bool darkMode;

  AppThemeData({
    required this.alert,
    required this.dark,
    required this.darkest,
    required this.disabledText,
    required this.green,
    required this.justWhite,
    required this.justWhiteText,
    required this.lightBackground,
    required this.lightBackgroundDisabled,
    required this.lightest,
    required this.medium,
    required this.offWhite,
    required this.primary1,
    required this.primary2,
    required this.primary2Grey,
    required this.primary4,
    required this.primary4Grey,
    required this.primary4White,
    required this.secondary,
    required this.shadow,
    required this.warning,
    required this.overlayStyle,
    required this.darkMode,
  });
}

class AppThemeVariants {
  static AppThemeData lightTheme = AppThemeData(
    alert: const Color(0xFFFF3333),
    dark: const Color(0xFF626072),
    darkest: const Color(0xFF343744),
    disabledText: const Color(0xFFCBD1E5),
    green: const Color(0xFF00C1B6),
    justWhite: const Color(0xFFFFFFFF),
    justWhiteText: const Color(0xFFFFFFFF),
    lightBackground: const Color(0xFFE9EDF7),
    lightBackgroundDisabled: const Color(0xFFE9EDF7),
    lightest: const Color(0xFFBDBCCF),
    medium: const Color(0xFF807F98),
    offWhite: const Color(0xFFF6F8FD),
    primary1: const Color(0xFF3453DC),
    primary2: const Color(0xFF667EF9),
    primary2Grey: const Color(0xFF667EF9),
    primary4: const Color(0xFF98AFFF),
    primary4Grey: const Color(0xFF98AFFF),
    primary4White: const Color(0xFF98AFFF),
    secondary: const Color(0xFFDDE7FF),
    shadow: const Color(0x40949EB9),
    warning: const Color(0xFFF39A14),
    overlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    darkMode: false,
  );

  static AppThemeData darkTheme = AppThemeData(
    alert: const Color(0xFFFF6565),
    dark: const Color(0xFFE2E4EB),
    darkest: const Color(0xFFF6F6F9),
    disabledText: const Color(0xFF8A89A2),
    green: const Color(0xFF0AB7AC),
    justWhite: const Color(0xFF262833),
    justWhiteText: const Color(0xFFF6F6F9),
    lightBackground: const Color(0xFF55546C),
    lightBackgroundDisabled: const Color(0xFF3A384A),
    lightest: const Color(0xFFBDBCCF),
    medium: const Color(0xFFC6C9D9),
    offWhite: const Color(0xFF444254),
    primary1: const Color(0xFF849FFF),
    primary2: const Color(0xFF667EF9),
    primary2Grey: const Color(0xFFBDBCCF),
    primary4: const Color(0xFF98AFFF),
    primary4Grey: const Color(0xFF807F98),
    primary4White: const Color(0xFFF6F6F9),
    secondary: const Color(0xFF656381),
    shadow: const Color(0x7D0A0A15),
    warning: const Color(0xFFF39A14),
    overlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
    darkMode: true,
  );
}
