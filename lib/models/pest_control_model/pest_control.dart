
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class PestControl {
  final String id;
  final String title;
  final String image;


  PestControl({
    required this.title,
    required this.image,
    required int id,
  }) : id = uuid.v4();
}