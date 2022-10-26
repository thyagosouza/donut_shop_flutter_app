import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/services/donut_bottom_bar_selection_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Consumer<DonutBottomSelectionService>(
        builder: (context, bottomBarSelectionService, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.trip_origin,
                  color: bottomBarSelectionService.tabSelection == "main"
                      ? AppColors.mainDark
                      : AppColors.mainColor,
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection("main");
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: bottomBarSelectionService.tabSelection == "favorites"
                      ? AppColors.mainDark
                      : AppColors.mainColor,
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection("favorites");
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color:
                      bottomBarSelectionService.tabSelection == "shoppingcart"
                          ? AppColors.mainDark
                          : AppColors.mainColor,
                ),
                onPressed: () {
                  bottomBarSelectionService.setTabSelection("shoppingcart");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
