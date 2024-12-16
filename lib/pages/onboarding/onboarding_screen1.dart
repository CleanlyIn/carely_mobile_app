import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreenone extends StatelessWidget {
  const OnboardingScreenone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/Cleanlylogo.png',
                height: 200,
              ),
            ),
          
            Image.asset(
              'assets/carpet.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            //),
            Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: AppStyles.green
                    ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Cleaning On Demand',
                          style: TextStyle(
                            color: AppStyles.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            fontFamily: GoogleFonts.laila().fontFamily,
                          ),
                        ),
                      ),
                      Text(
                        'Book an Appointment in less than 60 seconds  and geton the schedule as early as tommrow.',
                        style: TextStyle(
                          color: AppStyles.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: GoogleFonts.laila().fontFamily,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/home');
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: AppStyles.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  ),
                                )),
                            InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/login');
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: AppStyles.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 10,),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
