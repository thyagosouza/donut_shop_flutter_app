import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/pages/donut_shop_details_page.dart';
import 'package:donut_shop_app/pages/donut_shop_main_page.dart';
import 'package:donut_shop_app/pages/splash_page.dart';
import 'package:donut_shop_app/services/donut_bottom_bar_selection_service.dart';
import 'package:donut_shop_app/services/donut_service.dart';
import 'package:donut_shop_app/services/donut_shopping_cart_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonutBottomSelectionService()),
        ChangeNotifierProvider(create: (_) => DonutService()),
        ChangeNotifierProvider(create: (_) => DonutShoppingCartService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        navigatorKey: Utils.mainAppNav,
        routes: {
          //"/": (context) => DonutShopDetailsPage(),
          "/": (context) => SplashPage(),
          "/main": (context) => DonutShopMain(),
          "/details": (context) => DonutShopDetailsPage(),
        },
      ),
    ),
  );
}
