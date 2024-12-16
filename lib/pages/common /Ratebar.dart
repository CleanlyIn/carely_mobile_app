import 'package:flutter/material.dart';
class RatingBar extends StatefulWidget {
  final Function(double) onRatingUpdate;

  RatingBar({required this.onRatingUpdate});

  @override
  _RatingBarState createState() => _RatingBarState();

  static builder({required initialRating, required int minRating, required Axis direction, required bool allowHalfRating, required int itemCount, required double itemSize, required EdgeInsets itemPadding, required Icon Function(dynamic context, dynamic _) itemBuilder, required Null Function(dynamic ratingValue) onRatingUpdate}) {}
}

class _RatingBarState extends State<RatingBar> {
  double _currentRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _currentRating = index + 1.0;
            });
            widget.onRatingUpdate(_currentRating);
          },
        );
      }),
    );
  }
}