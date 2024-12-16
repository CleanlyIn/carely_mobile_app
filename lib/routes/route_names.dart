import 'package:cleanly/pages/about/about.dart';
import 'package:cleanly/pages/common%20/bottom_navigation.dart';
import 'package:cleanly/pages/home/account/account.dart';
import 'package:cleanly/pages/home/cart/cartScreen.dart';
import 'package:cleanly/pages/home/cart/detailsScreen.dart';
import 'package:cleanly/pages/home/cleanService/deepCleaning.dart';
import 'package:cleanly/pages/home/main_screen.dart';
import 'package:cleanly/pages/home/services/main_services.dart';
import 'package:cleanly/pages/login/login.dart';
import 'package:cleanly/pages/model/all_serviceModel.dart';
import 'package:cleanly/pages/onboarding/Onboarding_Screen.dart';
import 'package:cleanly/pages/onboarding/onboarding_screen1.dart';
import 'package:cleanly/pages/onboarding/splash_screen.dart';
import 'package:cleanly/pages/otp/otp.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String about = '/about';
  static const String onboarding = '/onboarding';
  static const String onboarding1 = '/onboarding1';
  static const String login = '/login';
  static const String verifyOtp = '/verifyOtp';
  static const String currentlocation = '/currentlocation';
  static const String cleaningViewScreen = '/cleaningViewScreen';
  static const String cartScreen = '/cartScreen';
  static const String deepcleanScreen = '/deepcleanScreen';
  static const String subcategorysWidget = '/subcategorysWidget';
  static const String mainScreen = '/mainScreen';
  static const String subcategoryViewDetails = '/subcategoryViewDetails';
  static const String accountScreen = '/accountScreen';
  static const String detailsScreen = '/detailsScreen';
  static const String mainServicesWidget = '/mainServicesWidget';
  static const String kitchencleaningservices = '/kitchen-cleaning-services';


  static Map<String, WidgetBuilder>get routes{
    return{
    splash: (context) => const SplashScreen(),
    home: (context) => MotionTabScreen(),
    about: (context) =>  HistoryPage(),
    onboarding: (context) => OnboardingScreen(),
    onboarding1: (context) => const OnboardingScreenone(),
    login: (context) => const LoginPage(),
    verifyOtp: (context) => const MyVerify(),
    cartScreen: (context) =>  const CartScreen(),
    deepcleanScreen: (context) => const DeepCleningWidget(),
    mainScreen: (context) =>const MainWidget(),
    accountScreen: (context) =>const AccountWidget(),
    detailsScreen: (context) =>const DetailsWidget(),
    mainServicesWidget: (context) =>const MainServicesWidget(),
  

    };
  }

}
