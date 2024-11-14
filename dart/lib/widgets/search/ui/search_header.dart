import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/shared/ui/width_wrapper/width_wrapper.dart';
import 'package:flutter_learning/widgets/search/ui/theme/extension.dart';

class SearchHeader extends StatelessWidget{
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container (
      width: double.infinity,
      color: context.searchHeaderColors.background,
      child: WidthWrapper(
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                color: context.searchHeaderColors.icons,
                Icons.menu
              ),
              tooltip: 'Navigation menu',
              onPressed: null, // null disables the button
            ),
            IconButton(
              icon: Icon(
                  color: context.searchHeaderColors.icons,
                  Icons.search
              ),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        )
      )
    );
  }
}