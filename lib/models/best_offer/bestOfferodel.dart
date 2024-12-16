
import 'package:uuid/uuid.dart';
var uuid = const Uuid();
class BestOffers {
  final String id;
  final String image;


  BestOffers({
  
    required this.image,
   required int id,
  }) : id = uuid.v4();
}