import 'package:flutter/material.dart';

class CustomOfferListView extends StatelessWidget {
  final List<String> items;

   const CustomOfferListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                // loadingBuilder: (context, error,
                //         stackTrace) =>
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: const CircularProgressIndicator(),
                //     ),
                image: AssetImage(items[index].toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
