import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.green,
        title: Text(
          "About Us",style: TextStyle(color: AppStyles.white,fontFamily:
                                          GoogleFonts.poppins().fontFamily,),
        ),
        leading:InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios,size: 16,color:AppStyles.white,)),

      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: FractionalOffset.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  softWrap: true,"About Us",style: TextStyle(color: AppStyles.black,fontFamily:GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold,fontSize: 20 ,decoration: TextDecoration.underline,
             decorationThickness: 3,),textAlign:TextAlign.center,),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,right: 20),
                child: Text(softWrap: true,"Cleanly, your ultimate destination for top-notch at-home services, is now in India. Through our user-friendly and technologically advanced platform, you can access a vast range of expert services at your convenience. Cleanly provides professional cleaning for commercial and residential properties. Get expert services delivered to your home and experience top-quality with a click!",style: TextStyle(color: AppStyles.black,fontFamily:GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,fontSize: 12),textAlign:TextAlign.start,),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,right: 20),
                child: Text(softWrap: true,"Cleanly seeks to make your life easier by offering top-notch services you may schedule whenever it's most convenient. Using our platform, you can schedule appointments for villa, office, sofa & carpet cleaning, pest control, and other services from your home. We guarantee a faultless, trustworthy, outstanding service experience that meets the highest standards, assuring you that you're getting first-rate care.",style: TextStyle(color: AppStyles.black,fontFamily:GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,fontSize: 12),textAlign:TextAlign.start,),
              ),
                 Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,right: 20),
                child: Text(softWrap: true,"We work closely with our carefully chosen service partners to keep this commitment. We make sure our staff is ready to satisfy your needs by providing them with the newest technology, thorough training, high-quality items, and necessary tools.",style: TextStyle(color: AppStyles.black,fontFamily:GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,fontSize: 12),textAlign:TextAlign.start,),
              ),
                 Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 10,right: 20),
                child: Text(softWrap: true,"Our Vision at Cleanly is ambitious - we aim to revolutionize the way services are delivered at home. By empowering millions of professionals worldwide, we strive to provide unparalleled quality and convenience. Join us in this exciting journey and be part of a global movement to transform at-home services.",style: TextStyle(color: AppStyles.black,fontFamily:GoogleFonts.lato().fontFamily,fontWeight: FontWeight.bold,fontSize: 12),textAlign:TextAlign.start,),
              ),
             // Image.asset("assets/cleanlyoly.jpeg",height: 50,width: 50,)
            ],
          ),
        ),
      ),
    );
  }
}