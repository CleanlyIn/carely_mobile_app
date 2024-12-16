import 'package:cleanly/pages/home/best_offer/best_offerlist.dart';
import 'package:cleanly/providers/home/best_offer/best_offer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class bestofferWidget extends StatelessWidget {

 bestofferWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
        create: (_) => BestOfferProvider(),
        child: Consumer<BestOfferProvider>(
          builder: (context, carouselProvider, child){
         
            return BestOfferListView();
          }
        ));
  }
}