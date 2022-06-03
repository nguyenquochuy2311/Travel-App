import 'package:flutter/src/widgets/container.dart';

class PopularDestination {
  final int id;
  final String name;
  final String source;
  PopularDestination({
    required this.id,
    required this.name,
    required this.source,
  });

  static map(Container Function(dynamic e) param0) {}
}

const List imgPopular = [
  {
    "id": 1,
    "name": "Japan",
    "source": "'public/images/Japan.png'",
  },
  {
    "id": 2,
    "name": "Indian",
    "source": "'public/images/Indian.png'",
  },
  {
    "id": 3,
    "name": "France",
    "source": "'public/images/France.png'",
  },
];
