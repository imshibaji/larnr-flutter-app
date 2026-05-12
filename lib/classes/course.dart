import 'package:learningapp/classes/user.dart';

class Course {
  int? id;
  String title;
  String slug;
  String? description;
  String? content;
  String status;
  User? author;
  String? duration;
  String? mode;
  String? batchSize;
  String? image;
  String? price;
  String? priceRanges;

  Course({
    this.id,
    required this.title,
    required this.slug,
    required this.status,
    this.description,
    this.content,
    this.image,
    this.price,
    this.priceRanges,
    this.author,
    this.duration,
    this.mode,
    this.batchSize,
  });
}
