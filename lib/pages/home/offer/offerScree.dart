
import 'package:cleanly/pages/home/customList/customOffer.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfferScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/placeholder.png',
    'assets/placeholder.png',
    'assets/placeholder.png',
    'assets/placeholder.png',
    'assets/placeholder.png',
    'assets/placeholder.png',
  ];

   OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.022;
    double multiplier = 0.8;
    return ChangeNotifierProvider(
        create: (_) => CleaningProvider(),
        child: Center(
          child: Consumer<CleaningProvider>(
            builder: (context, carouselProvider, child) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.15,
                          width: double.infinity,
                          child: CustomOfferListView(items: imageUrls)),
                          const SizedBox(height: 20,),
                       // Divider(color: Colors.grey.withOpacity(0.2),),
                      
                ],
              ),
            ),
          ),
        ));
  }
}
