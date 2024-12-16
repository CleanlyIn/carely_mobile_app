import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/pages/home/services/timeslot.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({super.key});

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  final emailController = TextEditingController();
    int activeStep = 0;
  int activeStep2 = 0;
  int reachedStep = 0;
  int upperBound = 5;
  double progress = 0.1;
  Set<int> reachedSteps = <int>{0, 2, 3, 4};
  final dashImages = [
    'assets/onboardig.png',
    'assets/onboardig.png',
    'assets/onboardig.png',
    'assets/onboardig.png',
    
  ];
   void increaseProgress() {
    if (progress < 1) {
      setState(() => progress += 0.1);
    } else {
      setState(() => progress = 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   
   
   return    Consumer<CartProvider>(
              builder: (context, visibilityProvider, child) {
                return
   
   Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // RichText(
            //   textAlign: TextAlign.start,
            //   text: TextSpan(
            //     text: 'Mighty Warner Infoserve(OPC) PVT LTD ',
            //     style: TextStyle(
            //         color: AppStyles.darkGray,
            //         fontWeight: FontWeight.w700,
            //         fontFamily: GoogleFonts.laila().fontFamily,
            //         fontSize: 12),
            //   ),
            // ),
            // RichText(
            //   text: TextSpan(
            //     text: "C 56/25,C Block,Phase 2 Noida SEC 62 ╰┈➤ ",
            //     style: TextStyle(
            //       color: AppStyles.lightGray,
            //       fontWeight: FontWeight.w400,
            //       fontSize: 12,
            //       fontFamily: GoogleFonts.laila().fontFamily,
            //     ),
            //   ),
            // )
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 EasyStepper(
                  activeStep: activeStep,
                  lineStyle: const LineStyle(
                    lineLength: 50,
                    lineType: LineType.normal,
                    lineThickness: 3,
                    lineSpace: 1,
                    lineWidth: 10,
                    unreachedLineType: LineType.dashed,
                  ),
                  stepShape: StepShape.rRectangle,
                  stepBorderRadius: 15,
                  borderThickness: 2,
                  internalPadding: 10,
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  stepRadius: 28,
                  finishedStepBorderColor: AppStyles.green,
                  finishedStepTextColor: AppStyles.green,
                  finishedStepBackgroundColor: AppStyles.green,
                  activeStepIconColor: AppStyles.green,
                  showLoadingAnimation: false,
                  steps: [
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 0 ? 1 : 0.3,
                          child: Image.asset('assets/onboardig.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Step-1',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 1 ? 1 : 0.4,
                          child: Image.asset('assets/onboardig.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Step-2',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 2 ? 1 : 0.4,
                          child: Image.asset('assets/onboardig.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Step-3',
                        textAlign: TextAlign.center,
                      ),
                    ),
                      EasyStep(
                      customStep: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Opacity(
                          opacity: activeStep >= 3 ? 2 : 0.4,
                          child: Image.asset('assets/onboardig.png'),
                        ),
                      ),
                      customTitle: const Text(
                        'Step-4',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    
                  ],
                  onStepReached: (index) => setState(() => activeStep = index),
                ),
               
                Wrap(
                  children: [

                  ],
                ),
                Text(
                  "Select Date",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                DatePicker(
                  height: 100,
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppStyles.green,
                  selectedTextColor: Colors.white,
                  onDateChange: (date) {
                    // New date selected
                    setState(() {
                  visibilityProvider.selectedValue = date;
                  print(">>>>>>>>>>>>>>>>${visibilityProvider.selectedValue}");
                    });
                  },
                ),
               const SizedBox(height: 20,),
               visibilityProvider.isVisible? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    
                    const SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        visibilityProvider.toggleVisibility();
                         print(">>>>>>>>>>>>>>>>${visibilityProvider.selectedValue}");
   if (activeStep < 2) { // Assuming there are 3 steps (0, 1, 2)
          setState(() {
            activeStep++;
          });
        }
                      },
                      child: Container(
                        alignment: FractionalOffset.bottomRight,
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppStyles.green,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text("Continue",style: TextStyle(fontWeight: FontWeight.w600,
                          color: AppStyles.white,
                            fontSize: size.width * 0.040,),),
                        ),
                      ),
                      ),
                    ),
                  ],
                ):const SizedBox(),
                
                SizedBox(
                  height: size.height * 0.020,
                ),
                Text(
                  "Choose Time",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                AspectRatio(aspectRatio: 16 / 9, child: GridViewPage()),

                 visibilityProvider.isVisible  ?const SizedBox(): SizedBox(
                   child:visibilityProvider.isVisible1 == false ?const SizedBox(): Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                           InkWell(
                        onTap: (){
                          visibilityProvider.toggleVisibility();
                      if (activeStep < 0) { // Assuming there are 3 steps (0, 1, 2)
                             setState(() {
                               activeStep--;
                             });
                           }
                        },
                        child: Container(
                          alignment: FractionalOffset.bottomRight,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppStyles.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Back",style: TextStyle(fontWeight: FontWeight.w600,
                            color: AppStyles.white,
                              fontSize: size.width * 0.040,),),
                          ),
                        ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                     visibilityProvider.selectedIndex!=null? InkWell(
                        onTap: (){
                          visibilityProvider.toggleVisibility1();
                      if (activeStep < 2) { // Assuming there are 3 steps (0, 1, 2)
                             setState(() {
                               activeStep++;
                             });
                           }
                        },
                        child: Container(
                          alignment: FractionalOffset.bottomRight,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppStyles.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Continue",style: TextStyle(fontWeight: FontWeight.w600,
                            color: AppStyles.white,
                              fontSize: size.width * 0.040,),),
                          ),
                        ),
                        ),
                      ):InkWell(
                        onTap: (){
                      //     visibilityProvider.toggleVisibility1();
                      // if (activeStep < 2) { // Assuming there are 3 steps (0, 1, 2)
                      //        setState(() {
                      //          activeStep++;
                      //        });
                      //      }
                        },
                        child: Container(
                          alignment: FractionalOffset.bottomRight,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppStyles.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Continue",style: TextStyle(fontWeight: FontWeight.w600,
                            color: AppStyles.white,
                              fontSize: size.width * 0.040,),),
                          ),
                        ),
                        ),
                      ),
                    ],
                                   ),
                 ),
                Text(
                  "Customer Address & Information",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: size.width * 0.040,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '  Name',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppStyles.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Full Name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '  Email',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppStyles.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '  phone No.',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppStyles.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter phone No.",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '  Address',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          color: AppStyles.red,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Address.",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '   House/Flat No.',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '(Optional)',
                        style: TextStyle(
                          color: AppStyles.blackShadowOp70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter House/Flat No.",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                        text: '   Landmark',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      TextSpan(
                        text: '(Optional)',
                        style: TextStyle(
                          color: AppStyles.blackShadowOp70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppStyles.white,
                          border: Border.all(
                              width: 1, color: AppStyles.blackShadowOp15),
                          borderRadius: BorderRadius.circular(05)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 6),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Near By Landmark",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppStyles.green),
                      color: const Color.fromARGB(
                          26, 10, 188, 138), // Converted color
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: SizedBox(
                      child: context
                              .watch<CartProvider>()
                              .shoppingCarts
                              .isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order Info",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: size.width * 0.040,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.010,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub Total",
                                        style: GoogleFonts.poppins(),
                                      ),
                                      Text(
                                        "₹${context.watch<CartProvider>().cartSubTotal}",
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.008,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Service charge",
                                        style: GoogleFonts.poppins(),
                                      ),
                                      Text(
                                        "₹${context.watch<CartProvider>().shippingCharge}",
                                        style: GoogleFonts.poppins(),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.015,
                                  ),
                                  const Divider(
                                    color: AppStyles.green,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "₹${context.watch<CartProvider>().cartTotal}",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container()),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                     InkWell(
                        onTap: (){
                          visibilityProvider.toggleVisibility1();
                      if (activeStep < 0) { // Assuming there are 3 steps (0, 1, 2)
                             setState(() {
                               activeStep--;
                             });
                           }
                        },
                        child: Container(
                          alignment: FractionalOffset.bottomRight,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppStyles.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text("Back",style: TextStyle(fontWeight: FontWeight.w600,
                            color: AppStyles.white,
                              fontSize: size.width * 0.040,),),
                          ),
                        ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                    Center(
                      child: SizedBox(
                     
                        height: size.height * 0.055,
                        child: ElevatedButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, "/detailsScreen");
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppStyles.green,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                color: AppStyles.white,
                                fontWeight: FontWeight.w800,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
              });
  }
}
