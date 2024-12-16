import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeAppbarActions extends StatefulWidget {
  const HomeAppbarActions({super.key});

  @override
  State<HomeAppbarActions> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeAppbarActions> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).onInit();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: context.watch<CartProvider>().token != null &&
                context.watch<CartProvider>().token != "null" &&
                context.watch<CartProvider>().token!.isNotEmpty
            ? Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cartScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 05),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -1,
                            child: context
                                    .watch<CartProvider>()
                                    .getitems
                                    .isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/cartScreen');
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                      radius: 10,
                                      child: Text(
                                        cartProvider.getitems.length.toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    radius: 10,
                                    child: Text(
                                      "0",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/cartScreen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 05),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.2)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                          Positioned(
                            top: -8,
                            right: -1,
                            child: context
                                    .watch<CartProvider>()
                                    .getTotalItems()
                                    .toString()
                                    .isNotEmpty
                                ? GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/cartScreen');
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.redAccent,
                                      radius: 10,
                                      child: Text(
                                        context
                                            .watch<CartProvider>()
                                            .getTotalItems()
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    radius: 10,
                                    child: Text(
                                      "0",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
