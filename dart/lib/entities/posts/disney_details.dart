
class DisneyDetails {
  const DisneyDetails({
    required this.id,
    required this.films,
    required this.createdAt,
    required this.imageUrl,
    required this.name
  });

  final int id;
  final List<String> films;
  final String createdAt;
  final String imageUrl;
  final String name;


  factory DisneyDetails.fromJson(
      Map<String, dynamic> json
  ) {

    print("fromJson: parse: $json");

    var imageUrl = "";

    if (json.containsKey("imageUrl")) {
        imageUrl = json["imageUrl"] as String;
    }

    final details = DisneyDetails(
        id: json["_id"] as int,
        films: [],
        createdAt: json["createdAt"] as String,
        imageUrl: imageUrl,
        name: json["name"] as String
    );

    return details;
  }

}
