import 'package:online_learning/features/message/domain/message.dart';

List<Message> demoMessages = [
  Message(
    author: 'Karlis Berzins',
    text:
        'Congratulations on completing the first lesson, keep up the good work!',
    dateCreated: DateTime.now(),
  ),
  Message(
    author: 'John Doe',
    text:
        'Your course has been updated, you can check the new course in your study course.',
    dateCreated: DateTime.now(),
    imageUrl: 'testImage',
  ),
];
