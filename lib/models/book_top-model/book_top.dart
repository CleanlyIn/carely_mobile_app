
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class BookTopService {
  final String id;
  final String title;
  final String title1;
  final String image;


  BookTopService({
    required this.title,
    required this.title1,
    required this.image,
    required int id,
  }) : id = uuid.v4();
}