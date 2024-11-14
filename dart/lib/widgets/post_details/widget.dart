import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/entities/posts/disney_details.dart';

class DisneyDetailsWidget extends StatelessWidget {
  final DisneyDetails disneyDetails;

  const DisneyDetailsWidget({
    required this.disneyDetails,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            "${disneyDetails.name}\n${disneyDetails.createdAt}"
        ),
      ],
    );
  }

}