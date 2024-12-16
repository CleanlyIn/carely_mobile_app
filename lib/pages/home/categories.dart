import 'package:cleanly/providers/home/categories_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  final List<String> imageUrls = [
    'https://via.placeholder.com/50x50',
    'https://via.placeholder.com/50x50',
    'https://via.placeholder.com/50x50',
    'https://via.placeholder.com/50x50',
    'https://via.placeholder.com/50x50',
    'https://via.placeholder.com/50x50',
  ];

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double unitHeightValue = MediaQuery.of(context).size.height * 0.022;
    double multiplier = 0.8;
    return ChangeNotifierProvider(
        create: (_) => CategoriesProvider(),
        child: Center(
          child: Consumer<CategoriesProvider>(
            builder: (context, carouselProvider, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 0,
                    childAspectRatio: MediaQuery.of(context).size.width *
                        0.8 /
                        (MediaQuery.of(context).size.height * 0.4 / 1),
                  ),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: imageUrls.length > 6 ? 6 : imageUrls.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        imageUrls.length == 4 || index <= 4
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/cleaningViewScreen');
                                  // cont.onClick(
                                  //     cont.getlist[index].id!
                                  //         .toInt(),
                                  //     cont.getlist[index].name
                                  //         .toString());
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      margin: const EdgeInsets.all(08),
                                      decoration: BoxDecoration(
                                        color: AppStyles
                                            .green20, // Container background color
                                        borderRadius: BorderRadius.circular(
                                            10), // Makes it a circle
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(
                                        //         0.1), // Shadow color with opacity
                                        //     spreadRadius: 1, // Spread radius
                                        //     blurRadius: 3, // Blur radius
                                        //     offset: const Offset(
                                        //         0, 0), // Offset of the shadow
                                        //   ),
                                        // ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Center(
                                          child: Image(
                                            // errorBuilder: (context, error,
                                            //         stackTrace) =>
                                            //     const CircularProgressIndicator(),
                                            image: NetworkImage(
                                                imageUrls[index].toString()),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        child: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: "Service Name",
                                              style: TextStyle(
                                                fontSize: multiplier *
                                                    unitHeightValue,
                                                color: AppStyles.black,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: GoogleFonts.laila()
                                                    .fontFamily,
                                              )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        index == 5
                            ? GestureDetector(
                                onTap: () {
                                  // Get.to(const RechargeBillWidget());
                                  //  cont.toggleVisibility();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      margin: const EdgeInsets.all(08),
                                      decoration: BoxDecoration(
                                        color: AppStyles
                                            .green20, // Container background color
                                        borderRadius: BorderRadius.circular(
                                            10), // Makes it a circle
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Colors.black.withOpacity(
                                        //         0.1), // Shadow color with opacity
                                        //     spreadRadius: 1, // Spread radius
                                        //     blurRadius: 3, // Blur radius
                                        //     offset: const Offset(
                                        //         0, 0), // Offset of the shadow
                                        //   ),
                                        // ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              'assets/application.png',
                                              height: 50,
                                              width: 50,
                                              color: AppStyles.green,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                text: "More",
                                                style: TextStyle(
                                                    fontSize: multiplier *
                                                        unitHeightValue,
                                                    color: AppStyles.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily:
                                                        GoogleFonts.lato()
                                                            .fontFamily)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      ],
                    );
                  },
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ));
  }
}
