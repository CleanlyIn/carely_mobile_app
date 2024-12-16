import 'package:cleanly/models/cart_models.dart';
import 'package:cleanly/models/getcartmodel.dart';

import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class DynamicCartItem extends StatefulWidget {
  final Items cartItem;
  final int index;

  const DynamicCartItem(
      {super.key, required this.cartItem, required this.index});

  @override
  State<DynamicCartItem> createState() => _CartItemState();
}

class _CartItemState extends State<DynamicCartItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
         widget.index==0?
             const Divider(
                                  color: Colors.grey,
                                  thickness: 0.3,
                                ):const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.30,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Image.network(
                    widget.cartItem.serviceDetails!.imageUrl.toString(),
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem.serviceDetails!.name.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: size.width * 0.035,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      "${widget.cartItem.serviceDetails!.discountPercent}% discount applied",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Row(
                      children: [
                        Text(
                          "₹ ${((widget.cartItem.serviceDetails!.price ?? 0) * (1 - (widget.cartItem.serviceDetails!.discountPercent ?? 0) / 100)).toStringAsFixed(2)}",
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.8),
                               fontSize: size.width * 0.045,
                          ),
                        ),
                        const SizedBox(width: 30,),
                        Text(
                          "₹${widget.cartItem.serviceDetails!.price}",
                          style: GoogleFonts.poppins(
                          
                              decoration: TextDecoration.lineThrough,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: size.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.030,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .incrementQty(widget.cartItem, widget.index);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.grey,
                              size: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          widget.cartItem.quantity.toString(),
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartProvider>()
                                .decrimentQty(widget.cartItem, widget.index);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     context
              //         .read<CartProvider>()
              //         .deleteAddToCartApi(widget.cartItem, widget.index);
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       const SnackBar(
              //         backgroundColor: Color.fromARGB(255, 247, 247, 247),
              //         content: Text(
              //           "Item removed!",
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ),
              //     );
              //   },
              //   child: CircleAvatar(
              //     backgroundColor: Colors.redAccent.withOpacity(0.07),
              //     radius: 18,
              //     child: const Icon(
              //       Icons.delete,
              //       color: Colors.redAccent,
              //       size: 14,
              //     ),
              //   ),
              // )
            ],
          ),
       
          const Divider(
                                  color: Colors.grey,
                                  thickness: 0.3,
                                )
        ],
      ),
    );
  }
}
