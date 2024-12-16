
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'location_provider.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void iniState() {
    
    super.initState();
  }


   @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LocationProvider(),
        child: Center(
          child: Consumer<LocationProvider>(
            builder: (context, locationProvider, child){
              // context.read<LocationProvider>().onInit();
             return  Scaffold(
      backgroundColor: AppStyles.white,
      appBar: AppBar(
        leading:const Icon(Icons.arrow_back_ios,size: 18,),
      
      ),
   
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.asset(
                                'assets/locationfind.webp',
                                fit: BoxFit.cover, height: 150,width: 150,color: AppStyles.green,
                              ),
                   ),
                   Consumer<LocationProvider>(
                    builder: (context, locationProvider, child) {
                      
                      if (locationProvider.currentAddress == null) {
                        return const Text('');
                      }
                      if(locationProvider.currentAddress != null || locationProvider.currentAddress!.isNotEmpty) {
                         Future.delayed(const Duration(seconds: 2), () {
                           Navigator.pushReplacementNamed(context, '/home');
                         });
                      }
                      return Center(
                        child: SizedBox(
                        width: 200,
                        child: Text('Address: ${locationProvider.currentAddress}',textAlign: TextAlign.center,),));
                      
                    },
                  ),
                
                ],
              ),
            ),
        Text("Where do you want your service?",    style: TextStyle(
                          color: AppStyles.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        textAlign: TextAlign.center,
                        ),
          GestureDetector(
              onTap: () {
                      locationProvider.fetchCurrentLocation();
                    },
            child: Container(
              margin:const EdgeInsets.all(8),
              height: 40,
              width: double.infinity,
                    decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppStyles.green
                    ),
                    child: Center(child: Text("At my current location",   style: TextStyle(
                            color: AppStyles.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          textAlign: TextAlign.center,
                          ),
                    ),
            ),
          ),
          const SizedBox(height: 20,)
        //       Container(
        //     margin:const EdgeInsets.all(8),
        //     height: 40,
        //     width: double.infinity,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   border: Border.all(color: AppStyles.green)
         
        // ),
        // child: Center(child: Text("I\' ll enter my location manually",   style: TextStyle(
        //                   color: AppStyles.green,
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 14,
        //                   fontFamily: GoogleFonts.poppins().fontFamily,
        //                 ),
        //                 textAlign: TextAlign.center,
        //                 ),
        // ),
        //   ),
        
          ],
        ),
      ),
         );
         
            }
    
    
   
          )));
  }
}

