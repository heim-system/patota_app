import 'package:flutter/material.dart';
part 'color_schemes.g.dart';
part 'outline_input_border.dart';

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: _buildBorder(_lightColorScheme.onPrimary),
        enabledBorder: _buildBorder(_lightColorScheme.primary),
        focusedBorder: _buildBorder(_lightColorScheme.secondary),
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 400,
          minHeight: 44,
          maxHeight: 44,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (states) => const Size(100, 44),
          ),
          maximumSize: MaterialStateProperty.resolveWith<Size>(
            (states) => const Size(300, 44),
          ),
        ),
      ),
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      inputDecorationTheme: InputDecorationTheme(
        disabledBorder: _buildBorder(_darkColorScheme.onPrimary),
        enabledBorder: _buildBorder(_darkColorScheme.primary),
        focusedBorder: _buildBorder(_darkColorScheme.tertiary),
      ),
    );
