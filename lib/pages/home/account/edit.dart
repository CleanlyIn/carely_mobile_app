import 'package:cleanly/pages/common%20/api_url.dart';
import 'package:cleanly/pages/home/account/TextFromFieldCus.dart';
import 'package:cleanly/providers/account/account_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWidget extends StatefulWidget {
  const EditWidget({super.key});

  @override
  State<EditWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountVisibilityProvider>(
      builder: (context, accountProvider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppStyles.green,
          leading:InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new,color: AppStyles.white,size: 16,)),
          title: Text("Edit Profile",style: TextStyle(color: AppStyles.white,fontFamily:
                                            GoogleFonts.poppins().fontFamily,),),
      
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomTextFormField(
                            focusNode: FocusNode(),
                            textInputType: TextInputType.text,
                            readonly: false,
                            controller:accountProvider.nameController,
                            text: "",
                            hintText: "",
                            labelText: "Full Name",
                          ),
                                       CustomTextFormField(
                            focusNode: FocusNode(),
                            textInputType: TextInputType.text,
                            readonly: false,
                            controller:accountProvider.emailController,
                            text: "",
                            hintText: "",
                            labelText: "Email Address",
                          ),
                                          CustomTextFormField(
                                           
                            focusNode: FocusNode(),
                          
                            textInputType: TextInputType.text,
                            readonly: true,
                            controller:accountProvider.phoneController,
                            text: "",
                            hintText: "",
                           
                            labelText: "Phone Number",
                          ),
                                           CustomTextFormField(
                            focusNode: FocusNode(),
                            textInputType: TextInputType.text,
                            readonly: false,
                            controller:accountProvider.addressController,
                            text: "",
                            hintText: "",
                            labelText: "Address",
                          ),
                          InkWell(
                            onTap: () async {
                              // final url = updateDetails;
                      final body = {
  "name": accountProvider.nameController.text,
  "email": accountProvider.emailController.text,
  "phone": accountProvider.phoneController.text,
  "image": "string"
};
                      print(">>>>>>>edit profile>>>>>>>$body");
                      accountProvider.setVisibility(true);
                      
                      try {
                        await accountProvider.patchdetails(updateDetails, body,context);
                         accountProvider.setVisibility(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data updated successfully')),
                         
                        );
                        
                      } catch (e) {
                         accountProvider.setVisibility(false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to post data: $e')),
                        );
                      }
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 10,right: 10,top: 50),
                                                    width: double.infinity,
                                                    height: MediaQuery.of(context).size.height * 0.055,
                                                    decoration: BoxDecoration(
                            color:AppStyles.green ,
                              border: Border.all(width: 1, color: AppStyles.green),
                              borderRadius: BorderRadius.circular(10)),
                                                    child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Update Now  ",
                                  style: TextStyle(
                                    color: AppStyles.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                accountProvider.isVisible?const CircularProgressIndicator(color: AppStyles.white,strokeWidth: 2,):const SizedBox()
                              ],
                            ),
                                                    ),
                                                  ),
                          ),
                          
            ],
          ),
        ),
      ),
    );
  }
}