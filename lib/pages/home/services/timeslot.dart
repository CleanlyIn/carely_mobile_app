import 'package:cleanly/pages/home/cart/CartProvider.dart';
import 'package:cleanly/theme/styling.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
  // Import the model class

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Consumer<CartProvider>(
        builder: (context, itemProvider, child) {
          return GridView.builder(
           shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          childAspectRatio: 3,
        ),
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              final isSelected = index == itemProvider.selectedIndex;
              return GestureDetector(
                 onTap: () {
                  print(">>>>>>>>>>>>>${index}");
                
                  itemProvider.selectIndex1(index);
                },
                child: Container(
                  alignment: FractionalOffset.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: isSelected ? AppStyles.green : Colors.white,
                    border: Border.all(width: 1,color: AppStyles.blackShadowOp20),
                    borderRadius: BorderRadius.circular(05)
                  ),
                  child: Text(item ,style: TextStyle(color:isSelected ? AppStyles.white : AppStyles.black ),),
                ),
              );
            },
          );
        },
      ),
    
    );
  }
}
