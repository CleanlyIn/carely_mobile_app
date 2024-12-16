

import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final String labelText;
  Widget? suffix;
  Widget? prefix;
  void Function(String)? onChange;
 

  CustomTextFormField({super.key, required this.text, required this.hintText, required this.labelText,this.suffix,this.prefix,this.onChange,this.controller,required this.readonly,this.textInputType,required this.focusNode});
 TextEditingController? controller;
 bool readonly;
TextInputType? textInputType;
FocusNode focusNode;

  @override
Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: TextFormField(
              keyboardType: textInputType,
              readOnly: readonly,
              focusNode: focusNode,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: prefix,
                hintText: hintText,
                labelText: labelText,
                suffixIcon: suffix,
                hintStyle: TextStyle(color: AppStyles.blackShadowOp15,fontSize: 12,fontFamily:  GoogleFonts.poppins().fontFamily,),
                labelStyle:TextStyle(color: AppStyles.black,fontSize: 18,fontFamily:  GoogleFonts.poppins().fontFamily,),
      
  
                 floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: AppStyles.red,
                )),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.1,
                 
                  color: AppStyles.red,
                )),
              ),

              cursorColor: AppStyles.darkGray,
            ),
          ),
        ],
      ),
    );
  }
}
