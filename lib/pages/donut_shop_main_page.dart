import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/pages/donut_bottom_bar.dart';
import 'package:donut_shop_app/pages/donut_main_page.dart';
import 'package:donut_shop_app/pages/donut_shopping_cart_page.dart';
import 'package:donut_shop_app/pages/donut_side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.mainDark),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.network(AppImages.donutLogoRedText, width: 120),
      ),
      drawer: Drawer(
        child: DonutSideMenu(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: Utils.mainListNav,
              initialRoute: "/main",
              onGenerateRoute: (RouteSettings settings) {
                Widget page;

                switch (settings.name) {
                  case "/main":
                    page = DonutMainPage();
                    break;
                  case "/favorites":
                    page = Center(
                      child: Text("favorites"),
                    );
                    break;
                  case "/shoppingcart":
                    page = DonutShoppingCartPage();
                    break;
                  default:
                    page = Center(child: Text("main"));
                    break;
                }

                return PageRouteBuilder(
                  pageBuilder: (_, __, ___) => page,
                  transitionDuration: Duration(seconds: 0),
                );
              },
            ),
          ),
          DonutBottomBar(),
        ],
      ),
    );
  }
}
