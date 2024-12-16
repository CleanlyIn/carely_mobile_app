
import 'package:cleanly/models/best_offer/bestOfferodel.dart';
import 'package:flutter/material.dart';


class BestOfferListView extends StatelessWidget {


     final List<BestOffers> bestoffer = [
    BestOffers(id: 1, image: 'assets/images/offers 1.png',),
    BestOffers(id: 2, image: 'assets/images/offers 2.png',),
    BestOffers(id: 3, image: 'assets/images/offers 1.png', ),
     BestOffers(id: 4, image: 'assets/images/offers 2.png',),
    BestOffers(id: 5,  image: 'assets/images/offers 1.png',),
  ];



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount:bestoffer.length ,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
                                        padding: const EdgeInsets.only(left: 10, right: 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(
                                          
                                            image: AssetImage(
                                                bestoffer[index].image.toString()),
                                          ),
                                        ),
                                      );
        },);
  }
}
