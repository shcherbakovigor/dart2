import 'package:flutter/material.dart';
import 'package:flutter_learning/app/theme/theme_data.dart';
import 'package:flutter_learning/entities/posts/disney_details.dart';
import 'package:flutter_learning/pages/post_details/widget.dart';
import 'package:go_router/go_router.dart';

class DisneyCard extends StatelessWidget {
  const DisneyCard({
    required this.disney,
    super.key
  });
  final DisneyDetails disney;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisneyDetailsPage(
              characterId: disney.id,
          ))
        );
      },
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              )
          ),
          child: Padding(
              padding:  const EdgeInsets.all(20),
              child: Expanded (
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0
                      ),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 28.0
                              ),
                              overflow: TextOverflow.fade,
                              disney.name,
                            )
                          ]
                      )
                  )
              )
          )
      ),
    );
  }
}