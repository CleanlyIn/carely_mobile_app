import 'package:uuid/uuid.dart';

var uuid = const Uuid();
class ViewServiceModel {
  final String id;
  final String title;
  final String image;


  ViewServiceModel({
    required this.title,
    required this.image,
    required int id,
  }) : id = uuid.v4();
}