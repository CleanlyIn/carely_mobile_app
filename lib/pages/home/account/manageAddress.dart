import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageAddressScreen extends StatelessWidget {
   ManageAddressScreen({super.key});

 List<String> option=["Edit","Delete"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppStyles.green,
          leading:InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new,color: AppStyles.white,size: 14,)),
          title: Text("Manage   Addresses",style: TextStyle(color: AppStyles.white,fontFamily:
                                            GoogleFonts.poppins().fontFamily,),),
      
        ),
        body: Column(
          children: [
            const  Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
               
                children: [
                  const Icon(Icons.add,color: Color.fromARGB(255, 7, 117, 207)),
                  const SizedBox(width: 30,),
                   Text("Add another address",style: TextStyle(color:const Color.fromARGB(255, 7, 117, 207),fontFamily:
                                              GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold),),
                                              
                ],
              ),
            ),
            const Divider(),

            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Home",style: TextStyle(color:AppStyles.black,fontFamily:
                                                    GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold),),
                                                    MenuAnchor(
                      builder:
            (BuildContext context, MenuController controller, Widget? child) {
                        return IconButton(
                          color: AppStyles.black,
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(Icons.more_horiz),
            tooltip: 'Show menu',
                        );
                      },
                      menuChildren: 
                      
                      List<MenuItemButton>.generate(
                        option.length,
                        (int index) => MenuItemButton(
            onPressed: (){
             // setState(() => selectedMenu = SampleItem.values[index])
            }
                ,
            child: Text(option[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                                               Padding(
                                                 padding: const EdgeInsets.only(left: 20,right: 10),
                                                 child: Text("169,BHA Milleniumm  Rd,C Block,Phase2,",style: TextStyle(color:AppStyles.black,fontFamily:
                                                                                                 GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.normal),),
                                               ),
                                              const Divider(),
                  ],
                );
                },)
          ],
        ),
    );
  }
}