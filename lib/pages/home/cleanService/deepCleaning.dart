
import 'package:cleanly/providers/ProductProvider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeepCleningWidget extends StatelessWidget {
  const DeepCleningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Image.network(
                'https://via.placeholder.com/2500x1200',
                fit: BoxFit.cover,
              ),

              // AppBar
              Positioned(
                top: 30,
                left: 10,
                right: 0,
                child: AppBar(
                  primary: false,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppStyles.green,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                              Icons.arrow_back_ios,
                              color: AppStyles.green,
                            )),
                          )),
                    ),
                  ),

                  backgroundColor: Colors.transparent,
                  elevation: 0, // Remove shadow
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text(
              "Deep House Cleaning",
              style: TextStyle(
                color: AppStyles.darkGray,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.laila().fontFamily,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Consumer<ProductProvider>(
                builder: (context, productprovider, child) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 0,
                  childAspectRatio: MediaQuery.of(context).size.width *
                      0.8 /
                      (MediaQuery.of(context).size.height * 0.5 / 1),
                ),
                shrinkWrap: true,
                itemCount: productprovider.imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<ProductProvider>(context, listen: false)
                          .scrollToIndex(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: const EdgeInsets.all(08),
                          decoration: BoxDecoration(
                            color:
                                AppStyles.green20, // Container background color
                            borderRadius:
                                BorderRadius.circular(10), // Makes it a circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Center(
                              child: Image(
                                // errorBuilder: (context, error,
                                //         stackTrace) =>
                                //     const CircularProgressIndicator(),
                                image: NetworkImage(productprovider
                                    .imageUrls[index].image
                                    .toString()),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: productprovider.imageUrls[index].title
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppStyles.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Relax And Unwind In A Sparkling Clean Bathroom With Our Expert Cleaners",
                                  style: TextStyle(
                                    color: AppStyles.darkGray,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  ),
                                ),
                                Text(
                                  "*4.75  (974K)",
                                  style: TextStyle(
                                    color: AppStyles.lightGray,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: GoogleFonts.laila().fontFamily,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppStyles.green,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        //  Navigator.pushNamed(context, '/verifyOtp');
                                      },
                                      child: Text(
                                        "View Details",
                                        style: TextStyle(
                                          color: AppStyles.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                          fontFamily:
                                              GoogleFonts.laila().fontFamily,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          Image.network(
                            'https://via.placeholder.com/100x100',
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                );

                //   Container(
                //     margin: EdgeInsets.only(left: 10,right: 10,bottom: 05),
                //     height: 150,
                //       //  decoration: BoxDecoration(
                //       //           border: Border.all(
                //       //             color: Colors.black26,
                //       //           ),
                //       //           borderRadius: BorderRadius.circular(15),
                //       //         ),
                //     width: double.infinity,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Row(
                //        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [

                //           SizedBox(
                //             width: MediaQuery.of(context).size.width*0.5,
                //             child: Column(
                //                mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text("Relax And Unwind In A Sparkling Clean Bathroom With Our Expert Cleaners",
                //                   style: TextStyle(
                //   color: AppStyles.darkGray,
                //   fontWeight: FontWeight.bold,

                //   fontFamily: GoogleFonts.laila().fontFamily,
                // ),),
                // Text("Details..",   style: TextStyle(
                //   color: AppStyles.green,
                //   fontWeight: FontWeight.w300,

                //   fontFamily: GoogleFonts.laila().fontFamily,
                // ),),

                //  SizedBox(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height*0.05,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor:AppStyles.green,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(10))),
                //       onPressed: () {
                //       //  Navigator.pushNamed(context, '/verifyOtp');

                //       },
                //       child: Text("Book Now",style:TextStyle(color: AppStyles.white,fontWeight: FontWeight.w700,fontSize: 15,fontFamily:GoogleFonts.laila().fontFamily,),)),
                // ),

                //               ],
                //             )),
                //            Image.network(
                //   'https://via.placeholder.com/300x300',
                //   fit: BoxFit.cover,
                // ),

                //         ],
                //       ),
                //     ),
                //   );
              },
            ),
          )
        ],
      ),
    );
  }
}
