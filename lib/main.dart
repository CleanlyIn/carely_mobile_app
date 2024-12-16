import 'package:cleanly/pages/common%20/pre_Utils.dart';
import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/providers/ProductProvider.dart';
import 'package:cleanly/providers/account/account_provider.dart';
import 'package:cleanly/providers/cleanly/subcate_provider.dart';
import 'package:cleanly/providers/cleanly/time_slot_provider.dart';
import 'package:cleanly/providers/home/bottomnavigation_provider.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/providers/home/top_%20recommended/recommended.dart';
import 'package:cleanly/providers/searchProvider.dart';
import 'package:cleanly/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/app_state_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefUtils().init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    //SettingsAccountDetailController.getThemeStatus();
    runApp(
      MultiProvider(
        providers: AppStateProvider.providers,
        child:const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TopRemmendedProvider>(
          create: (_) => TopRemmendedProvider(),
        ),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => CleaningProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => SubCategoryProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => TabBarProvider()),
        ChangeNotifierProvider(create: (_) => TimeSlotProvider()),
        ChangeNotifierProvider(create: (_) => AccountVisibilityProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carely',
        initialRoute: AppRoutes.splash,
        routes: AppRoutes.routes,
      ),
    );
  }
}
