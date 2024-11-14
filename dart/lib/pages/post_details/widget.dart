import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/disney_details.dart';
import 'package:flutter_learning/shared/ui/width_wrapper/width_wrapper.dart';
import 'package:http/http.dart';


DisneyDetails parseDetails(String responseBody) {
  print("parseDetails: responseBody: $responseBody");
  final parsed = jsonDecode(responseBody);

  print("parseDetails: $parsed");

  final data = parsed["data"];

  var imageUrl = "";
  if (data.containsKey("imageUrl")) {
    imageUrl = data["imageUrl"];
  }

  return DisneyDetails(
      id: data["_id"] as int,
      films: [],
      createdAt: data["createdAt"] as String,
      imageUrl: imageUrl,
      name: data["name"] as String
  );
}

Future<DisneyDetails> fetchDetails(
    Client client,
    int disneyCharId
) async {
  final response = await client.get(
      Uri.parse("https://api.disneyapi.dev/character/$disneyCharId")
  );

  return compute(
    parseDetails,
    response.body
  );
}

class DisneyDetailsPage extends StatelessWidget {
  const DisneyDetailsPage({
    required this.characterId,
    super.key
  });
  final int characterId;

  @override
  Widget build(
      BuildContext context
  ) {
    return FutureBuilder(
        future: fetchDetails(Client(), characterId),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
                return Scaffold(
                    body: SingleChildScrollView(
                        child: WidthWrapper(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                        "${snapshot.data!.name}\n${snapshot.data!.createdAt}"
                                    ),
                                    Image.network(
                                      snapshot.data!.imageUrl
                                    )
                                  ],
                                )
                            )
                        )
                    )
                );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        }
    );
  }
}
