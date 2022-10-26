import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/services/donut_shopping_cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DonutShoppingCartBadgeWidget extends StatelessWidget {
  const DonutShoppingCartBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DonutShoppingCartService>(
        builder: (context, cartService, child) {
      if (cartService.cartDonuts.isEmpty) {
        return SizedBox();
      }
      return Transform.scale(
        scale: 0.7,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Text(
                "${cartService.cartDonuts.length}",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_cart,
                size: 25,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      );
    });
  }
}
