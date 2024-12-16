
import 'package:cleanly/pages/home/pest_control/pest_controlList.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/providers/searchProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PestControlWidget extends StatelessWidget {

 const PestControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
        create: (_) => SearchProvider(),
        child: Consumer<SearchProvider>(
          builder: (context, carouselProvider, child){
         
            return Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: PestControlListView(),
            );
          }
        ));
  }
}