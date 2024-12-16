import 'package:cleanly/providers/history_provide/history.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<HistoryPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late HistoryProvider _tabControllerProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabControllerProvider = HistoryProvider();
    _tabControllerProvider.setController(_tabController);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppStyles.green, // Status bar color (header)
        statusBarIconBrightness: Brightness.light, // Status bar icon color
        systemNavigationBarColor:
            AppStyles.green, // Navigation bar color (footer)
        systemNavigationBarIconBrightness:
            Brightness.light, // Navigation bar icon color
      ),
    );
    return ChangeNotifierProvider<HistoryProvider>(
      create: (context) => _tabControllerProvider,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Booking History',
            style: GoogleFonts.poppins(
              color: AppStyles.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: Column(
            children: [
              Consumer<HistoryProvider>(
                builder: (context, tabControllerProvider, child) {
                  return DefaultTabController(
                    length: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TabBar(
                          labelPadding: const EdgeInsets.symmetric(
                              vertical: 0.3, horizontal: 18.0),
                          indicatorWeight: 4.0,
                          indicator: BoxDecoration(
                            color: AppStyles.green,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          //indicatorColor: AppStyles.black,
                          tabAlignment: TabAlignment.start,
                          dragStartBehavior: DragStartBehavior.start,
                          isScrollable: true,
                          indicatorPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 1.0),
                          unselectedLabelColor: AppStyles.black,
                          labelColor: AppStyles.white,
                          controller: tabControllerProvider.controller,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: (index) {
                            //controller.activeTabIndex.value = index;
                            // controller.onClickUpdate(
                            //     controller.activeTabIndex.value.toString());
                          },
                          tabs: const [
                            Tab(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.replay_circle_filled_rounded,
                                      size: 18,
                                      color: AppStyles.yellow,
                                    ),
                                    Text(
                                      // "lbl_crypto".tr,
                                      "  All  ",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        // fontSize: getFontSize(16),
                                        fontFamily: 'Helvetica Neue LT Com',

                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Color.fromARGB(255, 4, 98, 22),
                                    size: 18,
                                  ),
                                  Text(
                                    " Completed ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      // fontSize: getFontSize(16),
                                      fontFamily: 'Helvetica Neue LT Com',
                                      // color: ColorConstant.whiteA700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.cancel,
                                    color: AppStyles.red,
                                    size: 18,
                                  ),
                                  Text(
                                    " Canceled",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      // fontSize: getFontSize(15),
                                      fontFamily: 'Helvetica Neue LT Com',
                                      // color: ColorConstant.whiteA700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  );

                  // TabBar(
                  //   controller: tabControllerProvider.controller,
                  //   tabs: [
                  //     Tab(text: 'All'),
                  //     Tab(text: 'Completed'),
                  //     Tab(text: 'Canceled'),
                  //   ],
                  // );
                },
              ),
              Expanded(
                child: Consumer<HistoryProvider>(
                  builder: (context, tabControllerProvider, child) {
                    return TabBarView(
                      controller: tabControllerProvider.controller,
                      children: [
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 200,
                              width: 200,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/empty-notification.png")),
                            ),
                            Text(
                              'No booking Request right now',
                              style: GoogleFonts.laila(
                                color: AppStyles.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 200,
                              width: 200,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/empty-notification.png")),
                            ),
                            Text(
                              'No booking Found?',
                              style: GoogleFonts.laila(
                                color: AppStyles.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 200,
                              width: 200,
                              child: Image(
                                  image: AssetImage(
                                      "assets/images/empty-notification.png")),
                            ),
                            Text(
                              'No booking Cancel right now?',
                              style: GoogleFonts.laila(
                                color: AppStyles.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                      ],
                    );
                  },
                ),
              ),
            
            
            ],
          ),
        ),
      ),
    );
  }
}
