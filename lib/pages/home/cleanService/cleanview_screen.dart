import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/providers/ProductProvider.dart';
import 'package:cleanly/providers/home/categories_provider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CeaningViewWidget extends StatelessWidget {
  const CeaningViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CategoriesProvider(),
      child: Scaffold(
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
                  actions: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/cartScreen');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.shopping_cart,
                                  color: Colors.black26,
                                  size: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              top: -5,
                              right: -3,
                              child: context
                                      .watch<CartProvider>()
                                      .shoppingCarts
                                      .isNotEmpty
                                  ? CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                      radius: 10,
                                      child: Text(
                                        context
                                            .watch<CartProvider>()
                                            .shoppingCarts
                                            .length
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
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
                      (MediaQuery.of(context).size.height * 0.6 / 1),
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
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: productprovider.imageUrls[index].title
                                      .toString(),
                                  style: TextStyle(
                                    color: AppStyles.black,
                                    fontWeight: FontWeight.w600,
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
            child: Consumer<ProductProvider>(
                builder: (context, productprovider, child) {
              return ScrollablePositionedList.builder(
                itemScrollController: productprovider.itemScrollController,
                shrinkWrap: true,
                physics: const PageScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: productprovider.imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: AppStyles.lightGray.withOpacity(0.1)),
                          borderRadius:
                              BorderRadius.circular(10)), // Makes it a circle

                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        productprovider.imageUrls[index].title
                                            .toString(),
                                        style: TextStyle(
                                          color: AppStyles.darkGray,
                                          fontWeight: FontWeight.w800,
                                          fontFamily:
                                              GoogleFonts.laila().fontFamily,
                                        ),
                                      ),
                                      Text(
                                        '₹ ${productprovider.imageUrls[index].price.toString()}',
                                        style: TextStyle(
                                          color: AppStyles.darkGray,
                                          fontWeight: FontWeight.w400,
                                          fontFamily:
                                              GoogleFonts.laila().fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        width:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        margin: const EdgeInsets.all(02),
                                        decoration: const BoxDecoration(
                                          color: AppStyles
                                              .green20, // Container background color
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(
                                                  10)), // Makes it a circle
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppStyles.green20,
                                              // Shadow color with opacity
                                              spreadRadius: 1, // Spread radius
                                              blurRadius: 2, // Blur radius
                                              offset: Offset(
                                                  0, 0), // Offset of the shadow
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Center(
                                            child: Image(
                                              // errorBuilder: (context, error,
                                              //         stackTrace) =>
                                              //     const CircularProgressIndicator(),
                                              image: NetworkImage(
                                                  productprovider
                                                      .imageUrls[index].image
                                                      .toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          decoration: BoxDecoration(
                                            color: AppStyles
                                                .green, // Container background color
                                            borderRadius: const BorderRadius
                                                .only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight: Radius.circular(
                                                    10)), // Makes it a circle
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                    0.1), // Shadow color with opacity
                                                spreadRadius:
                                                    1, // Spread radius
                                                blurRadius: 3, // Blur radius
                                                offset: const Offset(0,
                                                    0), // Offset of the shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                              child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  "/subcategorysWidget");
                                            },
                                            child: Text(
                                              '+ADD',
                                              style: TextStyle(
                                                color: AppStyles.white,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: GoogleFonts.radley()
                                                    .fontFamily,
                                              ),
                                            ),
                                          )))
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              Text(
                                '* ${productprovider.imageUrls[index].description.toString()}',
                                style: TextStyle(
                                  color: AppStyles.darkGray,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: GoogleFonts.lato().fontFamily,
                                ),
                              ),
                            ],
                          )),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ],
      )),
    );
  }
}
