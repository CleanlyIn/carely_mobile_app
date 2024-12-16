import 'package:cleanly/providers/home/carouselprovider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class CarouselScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/2148119214 1.png',
    'assets/2148119214 1.png',
    'assets/2148119214 1.png',
    'assets/2148119214 1.png',
  ];

  CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CarouselProvider(),
        child: Center(
          child: Consumer<CarouselProvider>(
            builder: (context, carouselProvider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CarouselSlider(
                        items: imageUrls
                            .map(
                              (url) => ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                  child: Image(
                                    // loadingBuilder: (context, error,
                                    //               stackTrace) =>
                                    //           const CircularProgressIndicator(),
                                    image: AssetImage(
                                      url,
                                      // fit: BoxFit.cover,
                                      // width: double.infinity,
                                    ),
                                  )),
                            )
                            .toList(),
                        carouselController: carouselProvider.carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: true,
                          aspectRatio: 2,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            carouselProvider.currentIndex = index;
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageUrls.asMap().entries.map((entry) {
                          return InkWell(
                            onTap: () => carouselProvider.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: carouselProvider.currentIndex == entry.key
                                  ? 17
                                  : 7,
                              height: 9.0,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 5.0,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      carouselProvider.currentIndex == entry.key
                                          ? AppStyles.green
                                          : AppStyles.lightGray),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
