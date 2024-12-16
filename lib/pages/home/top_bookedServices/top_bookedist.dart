import 'package:cleanly/models/book_top-model/book_top.dart';
import 'package:cleanly/models/cart_models.dart';
import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/providers/home/top_%20recommended/recommended.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookTopServicesListView extends StatelessWidget {


 const BookTopServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopRemmendedProvider>(
        builder: (context, servicesProvider, child) {
      if (servicesProvider.topRemmonendservices.isEmpty) {
        servicesProvider.fetchServices1();
        return const Center(child: CircularProgressIndicator());
      }

      final service = servicesProvider.topRemmonendservices;

      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: service.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(26, 10, 188, 138), // Converted color
              borderRadius: BorderRadius.circular(05),
              // border: Border.all(color: itemColor, width: 0.4),
              // boxShadow: [
              //   BoxShadow(
              //     color: itemColor.withOpacity(0.1),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: const Offset(
              //         0, 3), // changes position of shadow
              //   ),
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Image(
                                image: AssetImage("assets/images/Broom.png")),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "CLEANING",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 12,
                                    color: AppStyles.green,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            service[index].name.toString(),
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text:
                                      '₹ ${service[index].price.toString()}  ',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ]),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  '${service[index].discountPercent.toString()}%off',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // RichText(
                            //   text:  TextSpan(children: [
                            //    const TextSpan(
                            //       text: '⏱︎',
                            //       style: TextStyle(
                            //           color: AppStyles.green,
                            //           fontSize: 10),
                            //     ),
                            //     TextSpan(
                            //       text: '23:00pm ',
                            //       style:const TextStyle(
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
                        ' ₹${((service[index].price ?? 0).toInt() * (1 - (service[index].discountPercent ?? 0) / 100)).toStringAsFixed(2)}', // Discounted price
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Image(
                        image: NetworkImage(service[index].imageUrl.toString()),
                        height: 150,
                        width: 80,
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.03,
                        left: 0,
                        right: 0,
                        child: Consumer<CartProvider>(
                            builder: (context, cartProvider, child) {
                          final existingItem = cartProvider.shoppingCarts
                              .firstWhere(
                                  (item) =>
                                      item.productId.id == service[index].id,
                                  orElse: () => CartModels(
                                      productId: service, quantity: 0));

                          return existingItem.quantity == 0
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: GestureDetector(
                                      onTap: () {
                                        //  cartProvider.addItemm(service1);
                                        context.read<CartProvider>().addItemm(
                                            service[index],
                                            service[index].productId.toString(),
                                            index);

                                        //            int indexx=context.read<CartProvider>().shoppingCarts.indexWhere((item) => item.productId.id == service.subChildren![index].id);

                                        //               print(">>>>>>>>>>>>>>>>>>..${context.read<CartProvider>().shoppingCarts[indexx].productId.name}");
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                Colors.green.withOpacity(0.8),
                                            content: const Text(
                                              "Item added!",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: AppStyles.green,
                                              borderRadius:
                                                  BorderRadius.circular(05)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Text(
                                              "Add",
                                              softWrap: true,
                                              style: TextStyle(
                                                color: AppStyles.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ))))
                              : Container(
                                  decoration: BoxDecoration(
                                      color: AppStyles.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            //  cartProvider.addItemm(service);
                                            context
                                                .read<CartProvider>()
                                                .incrementQtyy(
                                                    existingItem.id.toString(),
                                                    service[index]
                                                        .productId
                                                        .toString(),
                                                    index);

                                            const SnackBar(
                                              backgroundColor: Color.fromARGB(
                                                  255, 247, 247, 247),
                                              content: Text(
                                                "Add Item",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                        Text(
                                          existingItem.quantity.toString(),
                                          style: const TextStyle(
                                              color: AppStyles.white,
                                              fontSize: 20),
                                        ),

                                        existingItem.quantity>1?
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<CartProvider>()
                                                .decrimentQtyy(
                                                    existingItem.id.toString(),
                                                    service[index]
                                                        .productId
                                                        .toString(),
                                                    index);

                                            // cartProvider.removeItemm(index);
                                            // context.read<CartProvider>().decrimentQtyy( cartProvider.shoppingCarts[index].id.toString());

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                  "Item removed!",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ):GestureDetector(
                                          onTap: () {
                                             context
                                                .read<CartProvider>()
                                                .deleteAddToCartApi(
                                                    existingItem.id.toString(),
                                                   
                                                    index);
                                            context
                                                .read<CartProvider>()
                                                .decrimentQtyy1(
                                                    existingItem.id.toString(),
                                                    service[index]
                                                        .productId
                                                        .toString(),
                                                );

                                            // cartProvider.removeItemm(index);
                                            // context.read<CartProvider>().decrimentQtyy( cartProvider.shoppingCarts[index].id.toString());

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                  "Item removed!",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
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
            ),
          );
        },
      );
    });
  }
}
