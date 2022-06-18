import 'package:halopantai/model/review.dart';

class Beach {
  int id;
  String name;
  String address;
  String description;
  List<BeachImage>? images;
  List<Review>? reviews;

  Beach({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    this.images,
    this.reviews,
  });

  factory Beach.fromJson(Map<String, dynamic> json) => Beach(
        id: json['id'],
        name: json['beach_name'],
        address: json['beach_location'],
        description: json['beach_description'],
        images: json['images'] != null
            ? json['images']
                .map<BeachImage>((image) => BeachImage.fromJson(image))
                .toList()
            : [],
        reviews: json['reviews'] != null
            ? json['reviews']
                .map<Review>((review) => Review.fromJson(review))
                .toList()
            : [],
      );
}

class BeachImage {
  int id;
  String url;

  BeachImage({required this.id, required this.url});

  factory BeachImage.fromJson(Map<String, dynamic> json) =>
      BeachImage(id: json['id'], url: json['url']);
}

final beachList = [
  Beach(
    id: 1,
    name: 'Pantai Pasir Putih',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Pandawa',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Kuta',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Nusa Dua',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Sanur',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Jimbaran',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Tanah Lot',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Melasti',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
  Beach(
    id: 1,
    name: 'Pantai Lovina',
    address: 'Jalan, Bali',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore ',
  ),
];
