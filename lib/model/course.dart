class Course {
  final String name;
  final String author;
  final double price;
  final int durationInHours;
  final String categoryName;
  final int numberOfLikes;
  final String? imageUrl;

  const Course({
    required this.name,
    required this.author,
    required this.price,
    required this.durationInHours,
    required this.categoryName,
    required this.numberOfLikes,
    this.imageUrl,
  });
}
