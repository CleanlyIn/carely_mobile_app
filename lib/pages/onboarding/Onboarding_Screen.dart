import 'package:cleanly/models/app_state.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
        
          
            Center(
              child: Image.asset(
                'assets/splashicon.png',
                
              ),
            ),
        
              Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const SizedBox(height: 20,),
                  Text(
                    'Cleaning Services That Go  ',
                    style: TextStyle(
                      color: AppStyles.black,
                        fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  Text(
                    ' Beyond.',
                    style: TextStyle(
                      color: AppStyles.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                   Text(
                    'Your Expectations ',
                    style: TextStyle(
                      color: AppStyles.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                   const SizedBox(height: 20,),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      softWrap: true,
                      'Carely tranfromtransform your home and commercial space with meticulous care and attention.find flawless space with our Best VIP cleaning service and Unlock a new level of freshness in your place',
                      style: TextStyle(
                        color: AppStyles.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: () {
                Provider.of<AppState>(context, listen: false)
                    .completeOnboarding();
                Navigator.pushReplacementNamed(context, '/onboarding1');
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppStyles.green),
                  child: Center(
                      child: Text(
                     'Let\'s Get Started',
                    style: TextStyle(
                      color: AppStyles.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      fontFamily: GoogleFonts.laila().fontFamily,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
