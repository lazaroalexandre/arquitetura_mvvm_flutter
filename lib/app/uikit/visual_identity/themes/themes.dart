import 'package:flutter/material.dart';
import 'package:arquitetura_flutter/app/uikit/uikit.dart';
part '../schemes/light_color_schemes.dart';
part '../schemes/dark_color_schemes.dart';

ThemeData get ligthTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: _lightColorScheme.onPrimary,
          fontSize: 18,
        ),
        backgroundColor: _lightColorScheme.primary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(
          _lightColorScheme.primary,
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: _darkColorScheme.onInverseSurface,
          fontSize: 18,
        ),
        backgroundColor: _darkColorScheme.inversePrimary,
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(
          _darkColorScheme.inversePrimary,
        ),
      ),
    );
