import 'package:cleanly/models/app_state.dart';
import 'package:cleanly/pages/getlocation/main_location.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () async {
      var isOnboardingCompleted =
          Provider.of<AppState>(context, listen: false).isOnboardingCompleted;
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool? islogin = prefs.getBool("isLogin") ?? false;
      String? token = prefs.getString("accesstoken").toString();
      print(">>>>>>>>>>>>>>>>>$token");
      if (isOnboardingCompleted || token != "null" && token.isNotEmpty) {
       // Navigator.pushReplacementNamed(context, '/home');
        Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                             const LocationScreen()));
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    });

    return Scaffold(
    
      body: Center(
        child: Image.asset('assets/Cleanlylogo.png',)
        
        // image.asset(
        //   'assets/Cleanlylogo.png',

        //   frameRate: 30, // default is 15 FPS
        // ),
      ),
    );
  }
}
