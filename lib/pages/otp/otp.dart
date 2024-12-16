import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:cleanly/pages/getlocation/main_location.dart';
import 'package:cleanly/providers/otp_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key}) : super(key: key);

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  bool _isotpValid = false; // Flag to track if the phone number is valid
  String? _otp;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final phoneNumber = arguments['phoneNumber'] as String;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return ChangeNotifierProvider(
        create: (_) => OtpProvider(phoneNumber),
        child: Center(
            child: Consumer<OtpProvider>(
                builder: (context, otpProvider, child) => Scaffold(
                      extendBodyBehindAppBar: true,
                      appBar: AppBar(
                        backgroundColor: Colors.transparent,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      body: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/transaction-2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 25, right: 25),
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Image.asset(
                                  //   'assets/img1.png',
                                  //   width: 150,
                                  //   height: 150,
                                  // ),

                                  Text(
                                    "Verification Code",
                                    style: TextStyle(
                                      color: AppStyles.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily:
                                          GoogleFonts.laila().fontFamily,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Please  enter the 6-digit code sent on",
                                    style: TextStyle(
                                      color: AppStyles.lightGray,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.laila().fontFamily,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Pinput(
                                    length: 4,
                                    // defaultPinTheme: defaultPinTheme,
                                    // focusedPinTheme: focusedPinTheme,
                                    // submittedPinTheme: submittedPinTheme,

                                    showCursor: true,
                                    onCompleted: (pin) {
                                      setState(() {
                                        otpProvider.otp = pin;
                                        _isotpValid =
                                            otpProvider.otp.length > 3;
                                        if (_isotpValid) {
                                          _otp = otpProvider.otp.toString();
                                        } else {
                                          _otp = null;
                                        }
                                      });
                                      otpProvider.otp = pin;
                                      print("otp>>>>>>>>>>${otpProvider.otp}");
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.055,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: _isotpValid
                                                ? AppStyles.green
                                                : Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: _isotpValid
                                            ? () async {
                                                otpProvider.setVisibility(true);
                                                final url = verification;
                                                final body = {
                                                  'phone':
                                                      otpProvider.phoneNumber,
                                                  'otp': otpProvider.otp,
                                                };
                                                print(">>>>>>>>>>>>>>$body");
                                                otpProvider.setVisibility(true);

                                                try {
                                                  await otpProvider.postOtp(
                                                      url, body, context);
                                                  otpProvider
                                                      .setVisibility(false);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Data posted successfully')),
                                                  );
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LocationScreen()));
                                                } catch (e) {
                                                  otpProvider
                                                      .setVisibility(false);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Failed to post data: $e')),
                                                  );
                                                }
                                              }
                                            : null,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Verify Phone Number  ",
                                              style: TextStyle(
                                                color: AppStyles.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: GoogleFonts.laila()
                                                    .fontFamily,
                                              ),
                                            ),
                                            otpProvider.isVisible
                                                ? const Padding(
                                                  padding:  EdgeInsets.all(8.0),
                                                  child:  CircularProgressIndicator(
                                                      color: AppStyles.white,
                                                      strokeWidth: 2,
                                                    ),
                                                )
                                                :const SizedBox()
                                          ],
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                          onPressed: () async {
                                            final url = phoneAuth;
                                            final body = {
                                              "phone": otpProvider.phoneNumber
                                            };
                                            print(">>>>>>>login>>>>>>>$body");

                                            try {
                                              await otpProvider.postData(
                                                  url, body, context);

                                              otpProvider.setVisibility(false);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Resend Otp successfully')),
                                              );
                                            } catch (e) {
                                              otpProvider.setVisibility(false);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        'Failed Resend Otp: $e')),
                                              );
                                            }
                                          },
                                          child: Center(
                                            child: otpProvider.isVisible1
                                                ? const CircularProgressIndicator(
                                                    color: AppStyles.white,
                                                    strokeWidth: 2,
                                                  )
                                                : Text(
                                                    "Resend OTP ?",
                                                    style: TextStyle(
                                                      color: AppStyles.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 15,
                                                      fontFamily:
                                                          GoogleFonts.laila()
                                                              .fontFamily,
                                                    ),
                                                  ),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))));
  }
}
