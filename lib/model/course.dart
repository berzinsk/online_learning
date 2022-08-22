class Course {
  final String name;
  final String author;
  final double price;
  final int durationInHours;
  final String categoryName;
  final int numberOfLikes;
  final String dateCreated;
  final String? imageUrl;

  const Course({
    required this.name,
    required this.author,
    required this.price,
    required this.durationInHours,
    required this.categoryName,
    required this.numberOfLikes,
    required this.dateCreated,
    this.imageUrl,
  });
}
