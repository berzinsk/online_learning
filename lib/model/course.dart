import 'lecture.dart';

class Course {
  final String name;
  final String description;
  final String author;
  final double price;
  final int durationInHours;
  final String categoryName;
  final int numberOfLikes;
  final String dateCreated;
  final String? imageUrl;
  final List<Lecture> lectures;

  const Course({
    required this.name,
    required this.description,
    required this.author,
    required this.price,
    required this.durationInHours,
    required this.categoryName,
    required this.numberOfLikes,
    required this.dateCreated,
    required this.lectures,
    this.imageUrl,
  });
}
