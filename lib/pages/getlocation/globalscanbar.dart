import 'package:flutter/material.dart';

class GlobalSnackBar {
  final String message;
  final Color color;

  GlobalSnackBar({required this.message, required this.color});

//  void showSnackBar(BuildContext context) {
//     final snackBar = SnackBar(
//       content: Text(message),
//       backgroundColor: color,
//       // behavior: SnackBarBehavior.floating,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

  void showSnackBar(BuildContext context) {
    final snackBar1 = SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: color,
      content: Text(message, textAlign: TextAlign.center),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10.0),
      // ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar1);
  }
}
