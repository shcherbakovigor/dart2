import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/theme/theme.dart';

class SearchHeaderThemeColors extends ThemeExtension<SearchHeaderThemeColors>{
  final Color icons;
  final Color background;

  const SearchHeaderThemeColors({
    required this.icons,
    required this.background
  });

  static get light => const SearchHeaderThemeColors(
      icons: ThemeColor.black,
      background: ThemeColor.white
  );

  @override
  ThemeExtension<SearchHeaderThemeColors> copyWith({
    Color? icons,
    Color? background
  }) {
    return SearchHeaderThemeColors(
      icons: icons ?? this.icons,
      background: background ?? this.background
    );
  }

  @override
  ThemeExtension<SearchHeaderThemeColors> lerp(
      covariant ThemeExtension<SearchHeaderThemeColors>? other,
      double t
    ) {
    if (other is! SearchHeaderThemeColors) {
      return this;
    }

    return SearchHeaderThemeColors(
        icons: Color.lerp(icons, other.icons, t)!,
        background: Color.lerp(background, other.background, t)!
    );
  }
}