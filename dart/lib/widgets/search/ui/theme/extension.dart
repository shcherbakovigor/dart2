import 'package:flutter/material.dart';
import 'package:flutter_learning/widgets/search/ui/theme/colors.dart';

extension ChannelCardThemeContextExtension on BuildContext {
  SearchHeaderThemeColors get searchHeaderColors =>
      Theme.of(this).extension<SearchHeaderThemeColors>()!;
}