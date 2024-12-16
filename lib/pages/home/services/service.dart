import 'package:cleanly/pages/home/services/cleaninglist.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesWidget extends StatelessWidget {
  ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CleaningProvider(),
        child: Consumer<CleaningProvider>(
            builder: (context, carouselProvider, child) {
          return const Column(
            children: [
              CustomServicesListView(),
            ],
          );
        }));
  }
}
