import 'package:cleanly/pages/home/top_bookedServices/top_bookedist.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTopServicesWidget extends StatelessWidget {
 const BookTopServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CleaningProvider(),
        child: Consumer<CleaningProvider>(
            builder: (context, carouselProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: BookTopServicesListView(),
          );
        }));
  }
}
