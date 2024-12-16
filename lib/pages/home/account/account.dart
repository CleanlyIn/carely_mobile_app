import 'package:cleanly/pages/common%20/dotDivider.dart';
import 'package:cleanly/pages/home/account/about.dart';
import 'package:cleanly/pages/home/account/edit.dart';
import 'package:cleanly/pages/home/account/manageAddress.dart';
import 'package:cleanly/providers/account/account_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountWidget extends StatefulWidget {
  const AccountWidget({super.key});

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<AccountVisibilityProvider>(context, listen: false).onInit();
    });
  }

  @override
  Widget build(BuildContext context) {
      SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppStyles.green, // Status bar color (header)
        statusBarIconBrightness: Brightness.light, // Status bar icon color
        systemNavigationBarColor:  AppStyles.green, // Navigation bar color (footer)
        systemNavigationBarIconBrightness: Brightness.light, // Navigation bar icon color
      ),
    );
    return Center(
        child: Consumer<AccountVisibilityProvider>(
      builder: (context, carouselProvider, child) => WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          //  appBar: AppBar(
          //   leading: InkWell(
          //     onTap: () => Navigator.pop(context),
          //     child:const  Padding(
          //       padding: EdgeInsets.only(left: 10),
          //       child: Icon(
          //         Icons.arrow_back_ios,
          //         color: AppStyles.black,size: 20,
          //       ),
          //     ),
          //   ),
          //   automaticallyImplyLeading: false,

          // ),
          body: SingleChildScrollView(
              child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  carouselProvider.isVisible
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile",
                              softWrap: true,
                              style: TextStyle(
                                color: AppStyles.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: Center(
                                            child: Text(
                                          "Are You Sure ?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w700),
                                        )),
                                        content: Text(
                                          "Do you really want to login?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: <Widget>[
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                AppStyles.red,
                                                            width: 2.0)),
                                                    child: Center(
                                                        child: Text(
                                                      "No",
                                                      style: TextStyle(
                                                          color: AppStyles.red,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    Navigator.pushNamed(
                                                        context, '/login');
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: AppStyles.green
                                                        // border: Border.all(color: ColorConstant.blue,width: 2.5)
                                                        ),
                                                    child: Center(
                                                        child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                          color:
                                                              AppStyles.white,
                                                          fontSize: 12,
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    color: AppStyles.green,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: AppStyles.green)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  child: Text(
                                    "Login or Sign  up",
                                    style: TextStyle(
                                        color: AppStyles.white,
                                        fontSize: 14,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: DottedDivider(
                                color: Colors.grey,
                                height: 1.0,
                                dashWidth: 4.0,
                                dashSpace: 4.0,
                                indent: 1.0,
                                endIndent: 5.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      child: Icon(
                                        Icons.clean_hands_outlined,
                                        size: 16,
                                        color: AppStyles.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "About Cleanly",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, right: 20),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Verify Your Account",
                                  softWrap: true,
                                  style: TextStyle(
                                    color: AppStyles.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EditWidget()));
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.edit,
                                      size: 25,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                carouselProvider.mobilenumber.toString(),
                                softWrap: true,
                                style: TextStyle(
                                  color: AppStyles.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.2))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        child: Icon(
                                          Icons.note_alt_outlined,
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Text(
                                            "Booking & Plans",
                                            softWrap: true,
                                            style: TextStyle(
                                              color: AppStyles.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1,
                                          color: Colors.grey.withOpacity(0.2))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                        ),
                                        child: Icon(
                                          Icons.headphones,
                                          size: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Text(
                                            "Help & Support",
                                            softWrap: true,
                                            style: TextStyle(
                                              color: AppStyles.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: DottedDivider(
                                color: Colors.grey,
                                height: 1.0,
                                dashWidth: 4.0,
                                dashSpace: 4.0,
                                indent: 1.0,
                                endIndent: 5.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.location_pin,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageAddressScreen()));
                                            },
                                            child: Text(
                                              "Manage Address",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.wallet_giftcard,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Memberships",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            softWrap: true,
                                            "✫",
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontSize: 22,
                                                color: AppStyles.black,
                                                fontWeight: FontWeight.w400),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "My rating",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.calendar_today,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "My Booking",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.schedule,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Scheduled Booking",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.settings,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Setting",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            child: Icon(
                                              Icons.clean_hands_outlined,
                                              size: 16,
                                              color: AppStyles.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AboutUsWidget()));
                                            },
                                            child: Text(
                                              "About Cleanly",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 10, right: 20),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          size: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 20),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            26, 10, 188, 138),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color:
                                                Colors.grey.withOpacity(0.2))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Refer & earn ₹ 100",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                "Get ₹ 100 when your friend",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Completes their  first booking",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // Navigator.pushNamed(context, '/login');
                                                },
                                                child: Container(
                                                  alignment:
                                                      FractionalOffset.center,
                                                  height: 50,
                                                  width: 100,
                                                  margin: const EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10,
                                                      right: 10),
                                                  decoration: BoxDecoration(
                                                      color: AppStyles.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.4))),
                                                  child: Text(
                                                    " Refer now",
                                                    style: TextStyle(
                                                        color: AppStyles.white,
                                                        fontSize: 14,
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Image(
                                            image: AssetImage(
                                                "assets/Gift-icon.png"),
                                            height: 80,
                                            width: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: Center(
                                                  child: Text(
                                                "Are You Sure ?",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )),
                                              content: Text(
                                                "Do you really want to login?",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                              actions: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            border: Border.all(
                                                                color: AppStyles
                                                                    .red,
                                                                width: 2.0)),
                                                        child: Center(
                                                            child: Text(
                                                          "No",
                                                          style: TextStyle(
                                                              color:
                                                                  AppStyles.red,
                                                              fontSize: 12,
                                                              fontFamily: GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        carouselProvider
                                                            .onClicklogout(context);
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.04,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color:
                                                                AppStyles.green
                                                            // border: Border.all(color: ColorConstant.blue,width: 2.5)
                                                            ),
                                                        child: Center(
                                                            child: Text(
                                                          "Yes",
                                                          style: TextStyle(
                                                              color: AppStyles
                                                                  .white,
                                                              fontSize: 12,
                                                              fontFamily: GoogleFonts
                                                                      .poppins()
                                                                  .fontFamily,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          });

                                      // Navigator.pushNamed(context, '/login');
                                    },
                                    child: Container(
                                      alignment: FractionalOffset.bottomCenter,
                                      height: 50,
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          left: 10,
                                          top: 10,
                                          bottom: 40,
                                          right: 30),
                                      decoration: BoxDecoration(
                                          // color: AppStyles.green,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.grey
                                                  .withOpacity(0.4))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.logout_outlined,
                                            size: 20,
                                            color: AppStyles.red,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20, top: 10, bottom: 10),
                                            child: Text(
                                              " Logout",
                                              style: TextStyle(
                                                  color: AppStyles.red,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.w800),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          )),
        ),
      ),
    ));
  }
}
