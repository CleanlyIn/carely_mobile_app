import 'package:cleanly/pages/about/about.dart';
import 'package:cleanly/pages/home/account/account.dart';
import 'package:cleanly/pages/home/main_screen.dart';
import 'package:cleanly/pages/home/services/main_services.dart';
import 'package:cleanly/providers/home/bottomnavigation_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MotionTabScreen extends StatelessWidget {
  final List<Widget> _pages = [
    const MainWidget(),
    const MainServicesWidget(),
    HistoryPage(),
    const AccountWidget(),
  ];

   MotionTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TabBarProvider>(
        builder: (context, provider, child) {
          return _pages[provider.selectedIndex];
        },
      ),
      bottomNavigationBar: Material(
        elevation: 8.0, // Elevation for shadow effect
        color: Colors.white, 
        child: BottomNavigationBar(
          currentIndex: context.watch<TabBarProvider>().selectedIndex,
          onTap: (index) {
            context.read<TabBarProvider>().setSelectedIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cleaning_services),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          backgroundColor: Colors.white, // Background color
          selectedItemColor: AppStyles.green, // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item colo
          showSelectedLabels: true, // Show labels for selected items
          showUnselectedLabels: true, // Show labels for unselected items
        ),
      ),
    );
  }
}

// class MotionTabScreen extends StatelessWidget {
//   final List<Widget> _pages = [
//     const MainWidget(),
//     const MainServicesWidget(),
//      HistoryPage(),
//     const AccountWidget(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
//       body: Consumer<TabBarProvider>(
//         builder: (context, provider, child) {
//           return _pages[provider.currentIndex];
//         },
//       ),
//       bottomNavigationBar: Consumer<TabBarProvider>(
//         builder: (context, provider, child) {
//           return MotionTabBar(
//             initialSelectedTab: "Home",
//             useSafeArea: true, // ensures the tab bar is above the system navigation bar
//             labels:const ["Home", "All Services", " History","Account"],
            
//             icons:const [Icons.home, Icons.cleaning_services, Icons.history, Icons.person],
//             tabSize: 50,
//             tabBarHeight: 60,
//             textStyle: TextStyle(
//                                                       fontFamily: GoogleFonts.poppins()
//                                                           .fontFamily,
//                                                           color: AppStyles.green,
//                                                       fontSize: 12,
//                                                       fontWeight: FontWeight.w800),
//             tabIconColor: Colors.grey,
//             tabIconSize: 28.0,
//             tabIconSelectedSize: 26.0,
//             tabSelectedColor: AppStyles.green,
//             tabIconSelectedColor: Colors.white,
//             tabBarColor: Colors.white,
//             onTabItemSelected: (int index) {
//               provider.currentIndex = index;
//             },
//           );
//         },
//       ),
//     );
//   }
// }
