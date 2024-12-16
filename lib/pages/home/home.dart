import 'package:cleanly/pages/home/categories.dart';
import 'package:cleanly/pages/home/cleanService/cleaningScreen.dart';
import 'package:cleanly/pages/home/offer/offerScree.dart';
import 'package:cleanly/pages/home/slider_crousal.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_appbar_actions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Mighty Warner Infoserve(OPC) PVT LTD ',
                  style: TextStyle(
                    color: AppStyles.darkGray,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.laila().fontFamily,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "C 56/25,C Block,Phase 2  Noida  SEC 62 ╰┈➤ ",
                  style: TextStyle(
                    color: AppStyles.lightGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    fontFamily: GoogleFonts.laila().fontFamily,
                  ),
                ),
              )
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: HomeAppbarActions(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            CarouselScreen(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: CategoriesScreen(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cleaning Services",
                    style: TextStyle(
                      color: AppStyles.darkGray,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.laila().fontFamily,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      color: AppStyles.darkGray,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.laila().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            CleaningScreen(),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Offers",
                    style: TextStyle(
                      color: AppStyles.darkGray,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.laila().fontFamily,
                    ),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                      color: AppStyles.darkGray,
                      fontWeight: FontWeight.w700,
                      fontFamily: GoogleFonts.laila().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            OfferScreen(),
          ],
        )),
      ),
    );
  }
}
