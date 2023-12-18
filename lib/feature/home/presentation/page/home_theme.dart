import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData homeTheme() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
