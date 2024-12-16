import 'package:cleanly/pages/common%20/shimmer/getitemshimmer.dart';
import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/pages/home/cart/bottomsheetcheckout.dart';
import 'package:cleanly/pages/home/cart/cartItem.dart';
import 'package:cleanly/pages/home/cart/dynamiccart.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).onInit();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? token = context.watch<CartProvider>().token;
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyles.green,
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
            color: AppStyles.white,
            fontSize: size.width * 0.040,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: cartProvider.isLoading
          ? const ItemsListShimmerLoading()
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.010,
                  ),
                  token != null &&
                          token != "" &&
                          cartProvider.getitems.isNotEmpty
                      ? Expanded(
                          child: SizedBox(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: cartProvider.getitems.length > 0
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Consumer<CartProvider>(
                                          builder:
                                              (context, cartProvider, child) {
                                            return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: cartProvider.getitems.length,
        itemBuilder: (BuildContext context, int index) {
          final cartItem = cartProvider.getitems[index];
          return Slidable(
            key: ValueKey(cartItem.id), // Provide a unique key for each Slidable item
            
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
  
                  onPressed: (context) {
                    // Handle delete action
                    cartProvider.deleteAddToCartApi(cartItem, index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color.fromARGB(255, 247, 247, 247),
                        content: Text(
                          "Item removed!",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
               
                ),
              ],
            ),
            child: DynamicCartItem(
              cartItem: cartItem,
              index: index,
            ),
          );
        },
      );
                                          },
                                        ),
                                      ],
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.25,
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            size: size.width * 0.20,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.020,
                                          ),
                                          Text(
                                            "Your cart is empty!",
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: SizedBox(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: context
                                          .watch<CartProvider>()
                                          .getTotalItems()
                                          .toString()
                                          .isNotEmpty &&
                                      context
                                              .watch<CartProvider>()
                                              .cartSubTotal
                                              .toString() !=
                                          "0.0"
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   "My Cart",
                                        //   style: GoogleFonts.poppins(
                                        //     fontWeight: FontWeight.w600,
                                        //     fontSize: 16,
                                        //   ),
                                        // ),
                                        Consumer<CartProvider>(
                                          builder: (context, value, child) =>
                                              Column(
                                            children: value.shoppingCarts
                                                .map(
                                                  (cartItem) => CartItem(
                                                    cartItem: cartItem,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    )
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.25,
                                          ),
                                          Icon(
                                            Icons.shopping_cart,
                                            size: size.width * 0.20,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: size.height * 0.020,
                                          ),
                                          Text(
                                            "Your cart is empty!",
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ),
                  token != null && token != ""
                      // context
                      //             .watch<CartProvider>()
                      //             .getTotalItems()
                      //             .toString()
                      //             .isNotEmpty &&
                      //         context.watch<CartProvider>().cartSubTotal.toString() !=
                      //             "0.0"
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: size.height * 0.030,
                            ),
                            Center(
                              child: SizedBox(
                                width: size.width,
                                height: size.height * 0.055,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (token.toString() != "null" &&
                                        token.toString().isNotEmpty) {
              //                              showModalBottomSheet<void>(
              //   isScrollControlled: true,
              //   context: context,
              //   builder: (BuildContext context) {
              //     return const CheckoutBottomSheet(); // Show the separate bottom sheet widget
              //   },
              // );
                                      Navigator.pushNamed(
                                          context, "/detailsScreen");
                                    } else {
                                      showModalBottomSheet<void>(
                                        isScrollControlled: true,
                                        clipBehavior: Clip.none,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                right: 0,
                                                top: -70,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    shadows: [
                                                      BoxShadow(
                                                        color: Colors.white
                                                            .withOpacity(0.2),
                                                        blurRadius: 2.0,
                                                        offset:const Offset(0, 1),
                                                      ),
                                                    ],
                                                    Icons.cancel,
                                                    color: AppStyles.white,
                                                    size: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.05,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 20,
                                                    bottom:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.1),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "Login/SignUp ",
                                                          style: TextStyle(
                                                            color:
                                                                AppStyles.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18,
                                                            fontFamily:
                                                                GoogleFonts
                                                                        .poppins()
                                                                    .fontFamily,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              '/login');
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.055,
                                                          decoration: BoxDecoration(
                                                              color: AppStyles
                                                                  .green,
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: AppStyles
                                                                      .green),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                            child: Text(
                                                              "Login/SignUP",
                                                              style: TextStyle(
                                                                color: AppStyles
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontSize: 16,
                                                                fontFamily: GoogleFonts
                                                                        .laila()
                                                                    .fontFamily,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
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
                                    child: context
                                                    .watch<CartProvider>()
                                                    .token
                                                    .toString() !=
                                                "null" &&
                                            context
                                                .watch<CartProvider>()
                                                .token
                                                .toString()
                                                .isNotEmpty
                                        ? Text(
                                            "Checkout (₹${cartProvider.getCart.totalDiscountedPrice.toStringAsFixed(2) ?? ""})",
                                            style: TextStyle(
                                              color: AppStyles.white,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                          )
                                        : Text(
                                            "Login/Sign  up to proceed",
                                            style: TextStyle(
                                              color: AppStyles.white,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 20,
                              bottom: MediaQuery.of(context).size.height * 0.1),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Login/SignUp ",
                                    style: TextStyle(
                                      color: AppStyles.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.055,
                                    decoration: BoxDecoration(
                                        color: AppStyles.green,
                                        border: Border.all(
                                            width: 1, color: AppStyles.green),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Login/SignUP",
                                        style: TextStyle(
                                          color: AppStyles.white,
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
            ),
    );
  }
}
