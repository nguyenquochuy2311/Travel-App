import 'package:flutter/src/widgets/container.dart';

class PopularDestination {
  final int id;
  final String name;
  final String url;
  PopularDestination({
    required this.id,
    required this.name,
    required this.url,
  });

  factory PopularDestination.fromJson(Map<String, dynamic> json) =>
      PopularDestination(
        id: json["id"],
        name: json["name"],
        url: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

const List imgPopular = [
  {
    "id": 1,
    "name": "Japan",
    "url": "public/images/Japan.png",
  },
  {
    "id": 2,
    "name": "Indian",
    "url": "public/images/Indian.png",
  },
  {
    "id": 3,
    "name": "France",
    "url": "public/images/France.png",
  },
];
