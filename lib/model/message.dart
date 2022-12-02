class Message {
  final String author;
  final String text;
  final DateTime dateCreated;
  final String? imageUrl;

  const Message({
    required this.author,
    required this.text,
    required this.dateCreated,
    this.imageUrl,
  });
}
