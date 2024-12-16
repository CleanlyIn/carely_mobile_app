import 'dart:async';
import 'package:cleanly/pages/home/search/searchbar.dart';

import 'package:cleanly/routes/generateroute.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:cleanly/pages/home/best_offer/best_offer.dart';
import 'package:cleanly/pages/home/home_appbar_actions.dart';
import 'package:cleanly/pages/home/pest_control/pest_controlWidget.dart';
import 'package:cleanly/pages/home/services/service.dart';
import 'package:cleanly/pages/home/top_bookedServices/top_bookedscreen.dart';
import 'package:cleanly/theme/styling.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MainWidget> {
  final ScrollController scrollController2 = ScrollController();
  final searchController = TextEditingController();
  String currentAddress="";
  final List<String> _hintTexts = [
    '" Kitchen Cleaning "',
    '" Pest Control "',
    '" Villa "',
    '" Flat "',
    '" Malls Cleaning "',
  ];
  int _hintIndex = 0;
  bool isDeleting = false;
  String displayedPlaceholder = '';
Color _headerColor = Colors.transparent;
  late Timer _timer;
  final typingSpeed = const Duration(milliseconds: 10); // Typing speed
  final deletingSpeed = const Duration(milliseconds: 5); // Deleting speed
  final pauseBeforeDeleting = const Duration(seconds: 1);

  @override
  void initState()  {
   
    _startTypingAnimation();
    super.initState();
        scrollController2.addListener(_changeHeaderColor);
        
    _loadData();
  }

  bool isLoading = true;

  Future<void> _loadData() async {
    // Simulate a network request with a delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      isLoading = false; // Set loading to false after data is loaded
    });
   
  }

  void _startTypingAnimation() {
    _timer = Timer.periodic(typingSpeed + deletingSpeed + pauseBeforeDeleting,
        (timer) {
      setState(() {
        if (!isDeleting &&
            displayedPlaceholder.length < _hintTexts[_hintIndex].length) {
          displayedPlaceholder = _hintTexts[_hintIndex]
              .substring(0, displayedPlaceholder.length + 1);
        } else if (!isDeleting) {
          isDeleting = true;
          displayedPlaceholder = _hintTexts[_hintIndex];
        } else if (displayedPlaceholder.isNotEmpty) {
          displayedPlaceholder = displayedPlaceholder.substring(
              0, displayedPlaceholder.length - 1);
        } else {
          isDeleting = false;
          _hintIndex = (_hintIndex + 1) % _hintTexts.length;
        }
      });
    });
  }
 void _changeHeaderColor() {
    double offset = scrollController2.offset;
    Color newColor;

    // Change the color based on the scroll position
    if (offset <= 100) {
      // Gradually change from transparent to your desired color
      double opacity = offset / 100;
      newColor = AppStyles.white;
    } else {
      newColor = AppStyles.white;
    }

    // Update only if the color has changed
    if (newColor != _headerColor) {
      setState(() {
        _headerColor = newColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: AppStyles.green, // Status bar color
    //   statusBarIconBrightness: Brightness.light, // Status bar icon color
    //   systemNavigationBarColor: _headerColor, // Navigation bar color
    //   systemNavigationBarIconBrightness:
    //       Brightness.light, // Navigation bar icon color
    // ));

    return Scaffold(
      backgroundColor: AppStyles.white,
      body: isLoading
          ? const ShimmerLoading()
          : SafeArea(
            child: SingleChildScrollView(
              controller: scrollController2,
                child: Column(
                  children: [
                // ClipPath(
                //                     clipper: MovieTicketClipper(),
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(top: 20),
                //                       child: Container(
                //                         height: 70,
                //                         color: AppStyles.green,
                //                         child: Row(
                //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                //                           children: [
                //                             Padding(
                //                               padding: const EdgeInsets.only(top: 10),
                //                               child: Center(
                //                                 child: Image.asset(
                //                                   'assets/Cleanlylogo.png',
                //                                   height: 80,
                //                                   width: 80,
                //                                   color: AppStyles.white,
                //                                 ),
                //                               ),
                //                             ),
                //                             Padding(
                //                               padding: const EdgeInsets.only(top: 20),
                //                               child: Text(
                //                                 "Save 20% on every service",
                //                                 style: TextStyle(
                //                                   color: AppStyles.white,
                //                                   fontWeight: FontWeight.w700,
                //                                   fontFamily: GoogleFonts.laila().fontFamily,
                //                                   fontSize: 12,
                //                                 ),
                //                               ),
                //                             ),
                //                             const Padding(
                //                               padding: EdgeInsets.only(top: 20),
                //                               child: Icon(
                //                                 Icons.arrow_circle_right,
                //                                 color: AppStyles.white,
                //                               ),
                //                             ),
                //                           ],
                //                         ),
                //                       ),
                //                     ),
                //                   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: '',
                                style: TextStyle(
                                  color: AppStyles.darkGray,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: GoogleFonts.laila().fontFamily,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: "   Mighty Warner Infoserve (OPC) Pvt Ltd",
                               // text: "${currentAddress.toString()} ",
                                style: TextStyle(
                                  color: AppStyles.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: HomeAppbarActions(),
                        ),
                      ],
                    ),
                    StickyHeader(
                      
                      header: Container(
                      color: _headerColor,
              
                        child: Padding(
                          padding:
                              const EdgeInsets.only( left: 10, right: 10,bottom: 20,top: 10),
                          child: Container(
                              height:
                                 50, // Fix the height of the header to avoid half sticking issue
                              // Add padding for better appearance
                              alignment: Alignment.center,
                           decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 1,
                            offset: const Offset(1, 2),
                          ),
                        ],
                                            ),
                              child: TextField(
                                onChanged: (value) {
                                  // Update the search query in the provider
                                  //searchProvider.updateQuery(value);
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          SearchBarScreen(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        const begin = Offset(
                                            1.0, 0.0); // Start from the right side
                                        const end =
                                            Offset.zero; // End at the center
                                        const curve = Curves.easeInOut;
                                      
                                        var tween = Tween(begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));
                                      
                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
                                    ),
                                  );
                                  // Optionally handle onTap if you want specific actions when the field is tapped
                                },
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Search for $displayedPlaceholder",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontSize: 14,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 114, 116, 119),
                                    size: 22,
                                  ),
                                ),
                              )),
                        ),
                      ),
                                    
                                    //               GestureDetector(
                                    //                 onTap: (){
                                    //                     Navigator.push(
                                    //   context,
                                    //   PageRouteBuilder(
                                    //     pageBuilder: (context, animation, secondaryAnimation) => SearchBarScreen(),
                                    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    //       const begin = Offset(1.0, 0.0); // Start from the right side
                                    //       const end = Offset.zero;         // End at the center
                                    //       const curve = Curves.easeInOut;
                                    
                                    //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    
                                    //       return SlideTransition(
                                    //         position: animation.drive(tween),
                                    //         child: child,
                                    //       );
                                    //     },
                                    //   ),
                                    // );
                                    // },
                                    //                 child: Container(
                                    //                   margin: EdgeInsets.only(top: 20),
                                    //                   height: MediaQuery.of(context).size.height * 0.09,
                                    //                   color: Colors.white,
                                    //                   child: Container(
                                    //                     margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                                    //                     decoration: BoxDecoration(
                                    //                       color: Colors.white,
                                    //                       borderRadius: BorderRadius.circular(10.0),
                                    //                       border: Border.all(
                                    //                           width: 1, color: Colors.grey.withOpacity(0.2)),
                                    //                       boxShadow: [
                                    //                         BoxShadow(
                                    //                           color: Colors.grey.withOpacity(0.1),
                                    //                           spreadRadius: 0,
                                    //                           blurRadius: 1,
                                    //                           offset: const Offset(1, 2), // Shadow position
                                    //                         ),
                                    //                       ],
                                    //                     ),
                                    //                     child: Center(
                                    //                       child: TextField(
                                    //                         readOnly: true,
                                    //                         decoration: InputDecoration(
                                    //                           hintText: "Search for $displayedPlaceholder",
                                    //                           focusedBorder: InputBorder.none,
                                    //                           enabledBorder: InputBorder.none,
                                    //                           hintStyle: TextStyle(
                                    //                             fontFamily: GoogleFonts.poppins().fontFamily,
                                    //                             fontSize: 14,
                                    //                           ),
                                    //                           prefixIcon: const Icon(
                                    //                             Icons.search,
                                    //                             color: Color.fromARGB(255, 114, 116, 119),
                                    //                             size: 22,
                                    //                           ),
                                    //                         ),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                 ),
                                    //               ),
                      content: Column(
                        children: [
                          ServicesWidget(),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       left: 20, right: 10, top: 20),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         "Best Offers",
                          //         style: TextStyle(
                          //           color: AppStyles.black,
                          //           fontWeight: FontWeight.w600,
                          //           fontSize: 18,
                          //           fontFamily: GoogleFonts.poppins().fontFamily,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // AspectRatio(
                          //     aspectRatio: 16 / 9, child: bestofferWidget()),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Pest Control Services",
                                  style: TextStyle(
                                    color: AppStyles.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const  AspectRatio(
                              aspectRatio: 16 / 9, child: PestControlWidget()),
                          // AspectRatio(
                          //   aspectRatio: 16 / 9,
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 10, right: 10),
                          //     child: ClipRRect(
                          //       borderRadius: BorderRadius.circular(10),
                          //       child: const Image(
                          //         image:
                          //             AssetImage("assets/images/9654851 1.png"),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Recommended Services",
                                  style: TextStyle(
                                    color: AppStyles.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ),
                         const AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BookTopServicesWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
       scrollController2.removeListener(_changeHeaderColor);
    scrollController2.dispose();
  }
}

class Servicelist {
  final int id;
  final String title;
  final String image;

  Servicelist({required this.id, required this.title, required this.image});
}
