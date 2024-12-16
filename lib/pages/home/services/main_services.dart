import 'package:cleanly/pages/home/home_appbar_actions.dart';
import 'package:cleanly/pages/home/services/all_service.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MainServicesWidget extends StatelessWidget {
  const MainServicesWidget({super.key});

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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "All Services",
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          automaticallyImplyLeading: false,
          actions: const [
            HomeAppbarActions(),
          ],
        ),
        body: WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Padding(
                padding:const  EdgeInsets.all(8.0),
                child: Text("Comming soon.....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,fontFamily: GoogleFonts.poppins().fontFamily),),
              ),
            ) 
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: AllServicesWidget(),
            // )
            
            ));
  }
}
