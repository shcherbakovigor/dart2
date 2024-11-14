import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/disney_details.dart';
import '../../features/widget.dart';

class DisneyList extends StatefulWidget {
  const DisneyList({
    required this.characters,
    super.key
  });

  final List<DisneyDetails> characters;

  @override
  State<DisneyList> createState() => DisneyListState();
}

class DisneyListState extends State<DisneyList> {

  @override
  Widget build(BuildContext context) {
    var children =  widget.characters.map((channel){
      return DisneyCard(
          disney: channel
      );
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: children[index]
        );
      },
    );
  }
}