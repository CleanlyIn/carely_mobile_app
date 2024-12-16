import 'package:cleanly/models/cart_models.dart';
import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/pages/home/home_appbar_actions.dart';
import 'package:cleanly/providers/searchProvider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchViewDetails extends StatefulWidget {
  final dynamic service;
  final int index;

  const SearchViewDetails({super.key, this.service, required this.index});
  @override
  State<SearchViewDetails> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchViewDetails> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SearchProvider(),
        child: Center(child:
            Consumer<SearchProvider>(builder: (context, searchProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                widget.service.name.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              leading: InkWell(
                onTap: () => Navigator.pop(context),
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
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image(
                        image: NetworkImage(widget.service.imageUrl.toString()),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                      ),
                    ),
                    Text(
                      widget.service.name.toString(),
                      softWrap: true,
                      style: TextStyle(
                        color: AppStyles.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '₹ ${widget.service.price.toString()}  ',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ]),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                '${widget.service.discountPercent.toString()}%off',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '₹${(widget.service.price!.toInt() * (1 - widget.service.discountPercent! / 100)).toStringAsFixed(2)}', // Discounted price
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.service.description.toString(),
                      style: TextStyle(
                        color: AppStyles.lightGray,
                        fontSize: 12,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<CartProvider>(
                          builder: (context, cartProvider, child) {
                        final existingItem = cartProvider.shoppingCarts
                            .firstWhere(
                                (item) =>
                                    item.productId.id == widget.service.id,
                                orElse: () => CartModels(
                                    productId: widget.service, quantity: 0));

                        return Container(
                          decoration: BoxDecoration(
                              color: AppStyles.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    //  cartProvider.addItemm(service);
                                    context.read<CartProvider>().incrementQtyy(
                                        existingItem.id.toString(),
                                        widget.service.productId.toString(),
                                        widget.index);

                                    const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(255, 247, 247, 247),
                                      content: Text(
                                        "Add Item",
                                        style: TextStyle(color: Colors.white),
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
                                  existingItem.quantity.toString().toString(),
                                  style: const TextStyle(
                                      color: AppStyles.white, fontSize: 20),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<CartProvider>().decrimentQtyy(
                                        existingItem.id.toString(),
                                        widget.service.productId.toString(),
                                        widget.index);

                                    // cartProvider.removeItemm(index);
                                    // context.read<CartProvider>().decrimentQtyy( cartProvider.shoppingCarts[index].id.toString());

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          "Item removed!",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.remove,
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
              ),
            ),
          );
        })));
  }
}
