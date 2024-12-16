import 'package:cleanly/pages/home/main_screen.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllServicesWidget extends StatelessWidget {
  AllServicesWidget({super.key});
  final List<Servicelist> imageUrls = [
    Servicelist(
      id: 1,
      title: 'Offices Cleaning',
      image: 'assets/Background.png',
    ),
    Servicelist(
      id: 2,
      title: 'Malls    Cleaning',
      image: 'assets/Malls Cleaning 1.png',
    ),
    Servicelist(
      id: 3,
      title: 'Valla     Cleaning',
      image: 'assets/vall 1.png',
    ),
    Servicelist(
      id: 4,
      title: 'Flats   Cleaning',
      image: 'assets/flat 1.png',
    ),
    Servicelist(
      id: 5,
      title: 'Form House Cleaning',
      image: 'assets/formhouse 1.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CleaningProvider(),
        child: Consumer<CleaningProvider>(
            builder: (context, carouselProvider, child) {
          return ListView.builder(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: AppStyles.green),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset:const Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            26, 10, 188, 138), // Converted color
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Image(
                            image:
                                AssetImage(imageUrls[index].image.toString())),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          imageUrls[index].title,
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          clipBehavior: Clip.none,
                          context: context,
                          builder: (BuildContext context) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  right: 0,
                                  top: -70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      shadows: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.2),
                                          blurRadius: 2.0,
                                          offset:const Offset(0, 1),
                                        ),
                                      ],
                                      Icons.cancel,
                                      color: AppStyles.white,
                                      size: MediaQuery.of(context).size.height *
                                          0.05,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 20,
                                      bottom:
                                          MediaQuery.of(context).size.height *
                                              0.1),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Select Services ",
                                          style: TextStyle(
                                            color: AppStyles.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                          ),
                                        ),
                                      ),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 37.0,
                                          crossAxisSpacing: 4.0,
                                          childAspectRatio: 1,
                                        ),
                                        itemCount: imageUrls.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                  context,
                                                  '/subcategoryViewDetails');
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Wrap(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color
                                                          .fromARGB(26, 10, 188,
                                                          138), // Converted color
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.1),
                                                          spreadRadius: 5,
                                                          blurRadius: 7,
                                                          offset:const Offset(0,
                                                              3), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              18.0),
                                                      child: Image(
                                                          image: AssetImage(
                                                              imageUrls[index]
                                                                  .image)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      imageUrls[index].title,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          fontSize: 12),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2, color: AppStyles.green),
                            borderRadius: BorderRadius.circular(10),
                            color: AppStyles.green),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Click",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: AppStyles.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }));
  }
}
