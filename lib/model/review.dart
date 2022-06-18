class Review {
  int id;
  String name;
  String descReview;

  Review({
    required this.id,
    required this.name,
    required this.descReview,
  });

  factory Review.fromJson(Map<String, dynamic> json) =>
      Review(id: json['id'], name: json['name'], descReview: json['review']);
}

var listReview = [
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
  Review(
      name: 'Mark Noble',
      descReview:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris',
      id: 1),
];
