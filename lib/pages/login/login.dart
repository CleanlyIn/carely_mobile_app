import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:cleanly/pages/getlocation/main_location.dart';
import 'package:cleanly/providers/login_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool _isPhoneValid = false; // Flag to track if the phone number is valid
  String? _phoneNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginProvider(),
        child: Center(
            child: Consumer<LoginProvider>(
                builder: (context, loginProvider, child) => Scaffold(
                        // backgroundColor: AppStyles.lightPurple,
                        body: Form(
                      key: formKey,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/transaction-2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: MediaQuery.of(context).size.height * 0.1),
                            alignment: Alignment.topCenter,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'assets/Cleanlylogo.png',height: MediaQuery.of(context).size.height * 0.3,
                                    ),
                                  ),
                                
                                  Text(
                                    "Phone Verification",
                                    style: TextStyle(
                                      color: AppStyles.darkGray,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25,
                                      fontFamily:
                                          GoogleFonts.laila().fontFamily,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "We need to register your phone without getting started!",
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
                                    height: 30,
                                  ),
                                  IntlPhoneField(
                                    initialCountryCode: 'IN',
                                    cursorColor: AppStyles.black,
                                    decoration: const InputDecoration(
                                      labelText: "Enter Phone Number",
                                      labelStyle:
                                          TextStyle(color: AppStyles.black),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppStyles.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: AppStyles.black),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 3),
                                    ),
                                    onChanged: (phone) {
                                      setState(() {
                                        // Validate the phone number (customize this logic as needed)
                                        _isPhoneValid =
                                            phone.completeNumber.length >
                                                9; // Example length check
                                        if (_isPhoneValid) {
                                          _phoneNumber =
                                              phone.completeNumber.toString();
                                          loginProvider.phoneNumber =
                                              _phoneNumber.toString();
                                        } else {
                                          _phoneNumber = null;
                                        }
                                      });
                                    },
                                    validator: (phoneNumber) {
                                      if (phoneNumber == null ||
                                          phoneNumber.completeNumber.isEmpty) {
                                        return "Please enter a phone number";
                                      }
                                      if (!_isPhoneValid) {
                                        return "Phone number is incomplete or invalid";
                                      }
                                      return null;
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
                                            backgroundColor: _isPhoneValid
                                                ? AppStyles.green
                                                : Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        onPressed: _isPhoneValid
                                            ? () async {
                                                final url = phoneAuth;
                                                final body = {
                                                  "phone":
                                                      loginProvider.phoneNumber
                                                };
                                                print(
                                                    ">>>>>>>login>>>>>>>$body");
                                                loginProvider
                                                    .setVisibility(true);

                                                try {
                                                  await loginProvider.postData(
                                                      url, body, context);
                                                  loginProvider
                                                      .setVisibility(false);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Data posted successfully')),
                                                  );
                                                  Navigator.pushNamed(
                                                    context,
                                                    '/verifyOtp',
                                                    arguments: {
                                                      'phoneNumber':
                                                          loginProvider
                                                              .phoneNumber
                                                    },
                                                  );
                                                } catch (e) {
                                                  loginProvider
                                                      .setVisibility(false);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            'Failed to post data: $e')),
                                                  );
                                                }

                                                // Navigator.pushNamed(context, '/verifyOtp');
                                              }
                                            : null,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Send the code  ",
                                              style: TextStyle(
                                                color: AppStyles.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                fontFamily: GoogleFonts.laila()
                                                    .fontFamily,
                                              ),
                                            ),
                                            loginProvider.isVisible
                                                ?const Padding(
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LocationScreen()));
                                      //Navigator.pushNamed(context, '/home');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.055,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: AppStyles.darkGray),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(
                                            color: AppStyles.green,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            fontFamily:
                                                GoogleFonts.laila().fontFamily,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
