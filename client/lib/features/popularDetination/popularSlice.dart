// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.name,
    this.url,
  });

  int id;
  String name;
  String? url;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        name: json["name"],
        url: json["url"],
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
