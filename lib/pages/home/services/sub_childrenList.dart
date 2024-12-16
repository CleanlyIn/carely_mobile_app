import 'package:cleanly/models/cart_models.dart';
import 'package:cleanly/models/cartmodel.dart';
import 'package:cleanly/pages/common%20/dotDivider.dart';
import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/pages/home/home_appbar_actions.dart';
import 'package:cleanly/pages/home/slider_crousal.dart';
import 'package:cleanly/pages/model/all_serviceModel.dart';
import 'package:cleanly/providers/cleanly/subcate_provider.dart';
import 'package:cleanly/providers/home/service/cleaning_provider.dart';
import 'package:cleanly/providers/searchProvider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubChildrenScreen extends StatefulWidget {
  final Children service;
  final dynamic service1;
  final String matchingId;

  const SubChildrenScreen(
      {super.key,
      required this.service,
      this.service1,
      required this.matchingId});

  @override
  SubChildrenScreenState createState() => SubChildrenScreenState();
}

class SubChildrenScreenState extends State<SubChildrenScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToItem();
    });
  }

  void scrollToItem() {
    // Ensure the matching ID is not null
    if (widget.matchingId != null && widget.matchingId.toString() != "null") {
      // Find the index of the item with the matching ID
      int index = widget.service.subChildren!.indexWhere(
          (child) => child.id.toString() == widget.matchingId.toString());

      // Check if a matching item was found
      if (index != -1) {
        print("Matching item found at index: $index");

        // Calculate the scroll position based on item height
        double scrollPosition =
            index * 500.0; // Adjust this value based on your item's height

        // Scroll to the item
        _scrollController.animateTo(
          scrollPosition,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        print("No matching item found for ID: ${widget.matchingId}");
      }
    } else {
      print("Matching ID is null or invalid");
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppStyles.green, // Status bar color (header)
        statusBarIconBrightness: Brightness.light, // Status bar icon color
        systemNavigationBarColor:
            AppStyles.green, // Navigation bar color (footer)
        systemNavigationBarIconBrightness:
            Brightness.light, // Navigation bar icon color
      ),
    );

    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
        create: (_) => SubCategoryProvider(),
        child: Center(child: Consumer<SubCategoryProvider>(
            builder: (context, subCateprovider, child) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pushReplacementNamed(context, '/home'),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppStyles.darkGray.withOpacity(0.2),
                    size: 20,
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: HomeAppbarActions(),
                ),
              ],
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselScreen(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Text(
                      widget.service.name.toString(),
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Html(
                    shrinkWrap: true,
                    data: subCateprovider.isExpanded
                        ? widget.service.pageDescription.toString()
                        : '<p>${widget.service.pageDescription.toString().replaceAll(RegExp(r'<[^>]*>'), '').split(' ').take(20).join(' ')}...</p>',
                    style: {
                      "p": Style(
                        maxLines: subCateprovider.isExpanded ? null : 5,
                        textOverflow: subCateprovider.isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    },
                  ),
                  // Space between content and button
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        subCateprovider.toggle(); // Toggle the expanded state
                      },
                      child: Text(
                        subCateprovider.isExpanded
                            ? 'Read Less..'
                            : 'Read More..',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Colors.grey.withOpacity(0.2))),
                      child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.service.subChildren!.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.27,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Image(
                                                    image: AssetImage(
                                                        "assets/images/Broom.png")),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10),
                                                  child: Text(
                                                    "CLEANING",
                                                    style: TextStyle(
                                                        fontFamily: GoogleFonts
                                                                .poppins()
                                                            .fontFamily,
                                                        fontSize: 12,
                                                        color: AppStyles.green,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Text(
                                            softWrap: true,
                                            widget.service.subChildren![index]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontSize: 14,
                                                color: AppStyles.black,
                                                fontWeight: FontWeight.w600),
                                            textAlign: TextAlign.start,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Row(
                                              children: [
                                                Text(
                                                  softWrap: true,
                                                  "✫",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily,
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textAlign: TextAlign.start,
                                                ),
                                                Text(
                                                  softWrap: true,
                                                  "4.85 (11.9 M bookings)",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily,
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  textAlign: TextAlign.start,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: DottedDivider(
                                              color: Colors.grey,
                                              height: 1.0,
                                              dashWidth: 4.0,
                                              dashSpace: 4.0,
                                              indent: 16.0,
                                              endIndent: 75.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Row(
                                              children: [
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                      text:
                                                          '₹ ${widget.service.subChildren![index].price.toString()}',
                                                      style: const TextStyle(
                                                          color: Colors.red,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 14),
                                                    ),
                                                  ]),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 10),
                                                    child: Text(
                                                      '${widget.service.subChildren![index].discountPercent.toString()}%off',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // RichText(
                                                //   text:
                                                //       const TextSpan(children: [
                                                //     TextSpan(
                                                //       text: '  ⏱︎',
                                                //       style: TextStyle(
                                                //           color:
                                                //               AppStyles.green,
                                                //           fontSize: 10),
                                                //     ),
                                                //     TextSpan(
                                                //       text: '23:00pm ',
                                                //       style: TextStyle(
                                                //         color: Colors.grey,
                                                //         fontSize: 12,
                                                //         fontWeight:
                                                //             FontWeight.normal,
                                                //       ),
                                                //     ),
                                                //   ]),
                                                // ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '  ₹${(widget.service.subChildren![index].price! * (1 - widget.service.subChildren![index].discountPercent! / 100)).toStringAsFixed(2)}', // Discounted price
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Stack(
                                      fit: StackFit.loose,
                                      children: [
                                        Image(
                                          image: NetworkImage(widget.service
                                              .subChildren![index].imageUrl
                                              .toString()),
                                          height: 150,
                                          width: 80,
                                        ),
                                        Positioned(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                          left: 0,
                                          right: 0,
                                          child: Consumer<CartProvider>(builder:
                                              (context, cartProvider, child) {
                                            final existingItem = cartProvider
                                                .shoppingCarts
                                                .firstWhere(
                                                    (item) =>
                                                        item.productId.id ==
                                                        widget
                                                            .service
                                                            .subChildren![index]
                                                            .id,
                                                    orElse: () => CartModels(
                                                        productId:
                                                            widget.service1,
                                                        quantity: 0));

                                            return existingItem.quantity == 0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8, right: 8),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          //  cartProvider.addItemm(service1);
                                                          context
                                                              .read<
                                                                  CartProvider>()
                                                              .addItemm(
                                                                  widget.service
                                                                          .subChildren![
                                                                      index],
                                                                  widget
                                                                      .service
                                                                      .subChildren![
                                                                          index]
                                                                      .productId
                                                                      .toString(),
                                                                  index);

                                                          int indexx = context
                                                              .read<
                                                                  CartProvider>()
                                                              .shoppingCarts
                                                              .indexWhere((item) =>
                                                                  item.productId
                                                                      .id ==
                                                                  widget
                                                                      .service
                                                                      .subChildren![
                                                                          index]
                                                                      .id);

                                                          print(
                                                              ">>>>>>>>>>>>>>>>>>..${context.read<CartProvider>().shoppingCarts[indexx].productId.name}");
                                                          // ScaffoldMessenger.of(context)
                                                          //     .showSnackBar(
                                                          //   SnackBar(
                                                          //     backgroundColor:
                                                          //         Colors.green.withOpacity(0.8),
                                                          //     content: const Text(
                                                          //       "Item added!",
                                                          //       style: TextStyle(
                                                          //         color: Colors.white,
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // );
                                                        },
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                                color: AppStyles
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            05)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(4.0),
                                                              child: Text(
                                                                "Add",
                                                                softWrap: true,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      AppStyles
                                                                          .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14,
                                                                  fontFamily: GoogleFonts
                                                                          .poppins()
                                                                      .fontFamily,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ))))
                                                : Container(
                                                    decoration: BoxDecoration(
                                                        color: AppStyles.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              //  cartProvider.addItemm(service);
                                                              context.read<CartProvider>().incrementQtyy(
                                                                  existingItem
                                                                      .id
                                                                      .toString(),
                                                                  widget
                                                                      .service
                                                                      .subChildren![
                                                                          index]
                                                                      .productId
                                                                      .toString(),
                                                                  index);

                                                              //               const SnackBar(
                                                              //   backgroundColor: Color.fromARGB(255, 247, 247, 247),
                                                              //   content: Text(
                                                              //     "Add Item",
                                                              //     style: TextStyle(color: Colors.white),
                                                              //   ),
                                                              // );
                                                            },
                                                            child: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          cartProvider
                                                                  .isLoadingAtIndex1(
                                                                      index)
                                                              ? const Padding(
                                                                  padding: EdgeInsets.only(
                                                                      top: 8.0,
                                                                      bottom:
                                                                          8.0),
                                                                  child: Center(
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          20, // Custom height
                                                                      width:
                                                                          20, // Custom width
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(Colors.white),
                                                                        strokeWidth:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              : Text(
                                                                  existingItem
                                                                      .quantity
                                                                      .toString()
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: AppStyles
                                                                          .white,
                                                                      fontSize:
                                                                          20),
                                                                ),
                                                                existingItem.quantity>1?
                                                          GestureDetector(
                                                            onTap: () {
                                                              context.read<CartProvider>().decrimentQtyy(
                                                                  existingItem
                                                                      .id
                                                                      .toString(),
                                                                  widget
                                                                      .service
                                                                      .subChildren![
                                                                          index]
                                                                      .productId
                                                                      .toString(),
                                                                  index);

                                                              // cartProvider.removeItemm(index);
                                                              // context.read<CartProvider>().decrimentQtyy( cartProvider.shoppingCarts[index].id.toString());

                                                              //                                                 ScaffoldMessenger.of(context).showSnackBar(
                                                              // const SnackBar(
                                                              //   backgroundColor: Colors.green,
                                                              //   content: Text(
                                                              //     "Item removed!",
                                                              //     style: TextStyle(color: Colors.white),
                                                              //   ),
                                                              // ),
                                                              //                                                 );
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                              size: 14,
                                                            ),
                                                          )
                                                              : GestureDetector(
                                                                onTap: () {
                                                                  print(
                                                                      "productId:${existingItem.id.toString()} Id:${widget.service.subChildren![index].productId.toString()}  index:$index");
                                                                  context.read<CartProvider>().deleteAddToCartApi(
                                                                     widget
                                                                          .service
                                                                          .subChildren![
                                                                              index],
                                                                   
                                                                      index
                                                                      );
                                                                        

                                                                  // cartProvider.removeItemm(index);
                                                              context.read<CartProvider>().decrimentQtyy1(
                                                                      existingItem
                                                                          .id
                                                                          .toString(),
                                                                      widget
                                                                          .service
                                                                          .subChildren![
                                                                              index]
                                                                          .productId
                                                                          .toString(),
                                                                    );

                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(
                                                                    const SnackBar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                      content:
                                                                          Text(
                                                                        "Item removed!",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons.delete,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 14,
                                                                ),
                                                              )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Description :',
                                      style: TextStyle(
                                          color: AppStyles.black,
                                          fontSize: 13,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text:
                                          ' ${widget.service.subChildren![index].description.toString()} ',
                                      style: const TextStyle(
                                        color: AppStyles.lightGray,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ]),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 0.3,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        })));
  }
}
