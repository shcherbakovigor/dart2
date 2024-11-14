import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/disney_details.dart';
import 'package:flutter_learning/shared/theme/theme.dart';

import '../../widgets/posts_list/posts_list.dart';

List<DisneyDetails> parseDisneyList(String responseBody) {
    final parsed = jsonDecode(
        responseBody
    );

    final data = (
        parsed["data"] as List
    ).cast<Map<String, dynamic>>();

    print("data_list: $data");

    final listMap = data.map<DisneyDetails>(
            (json) => DisneyDetails.fromJson(json)
    ).toList();

    print("parsed: $listMap");

    return listMap;
    //https://docs.flutter.dev/cookbook/networking/background-parsing
}

Future<List<DisneyDetails>> fetchDisneyList(Client client) async {
    final response = await client.get(
        Uri.parse("https://api.disneyapi.dev/character")
    );

    return compute(
        parseDisneyList,
        response.body
    );
}

class HomePage extends StatefulWidget {
    const HomePage({super.key});
    @override
    State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

    late Future<List<DisneyDetails>> disneyList;

    @override
    void initState() {
        // TODO: implement initState
        super.initState();

        disneyList = fetchDisneyList(
            Client()
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: ThemeColor.secondaryWhite,
            appBar: AppBar(),
            body: FutureBuilder<List<DisneyDetails>>(
                future: disneyList,
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return DisneyList(
                            characters: snapshot.data!
                        );
                    } else {
                        return const Center(
                            child: CircularProgressIndicator(),
                        );
                    }
                }
            )
        );
    }
}