import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/models/donut_model.dart';
import 'package:donut_shop_app/services/donut_service.dart';
import 'package:donut_shop_app/services/donut_shopping_cart_service.dart';
import 'package:donut_shop_app/widgets/donut_shopping_cart_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutShopDetailsPage extends StatefulWidget {
  @override
  State<DonutShopDetailsPage> createState() => _DonutShopDetailsPageState();
}

class _DonutShopDetailsPageState extends State<DonutShopDetailsPage>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? controller; //* controls the animation
  Animation<double>? rotationAnimation; //* executes animation.
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 20), vsync: this)
          ..repeat();
    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller!, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // selectedDonut = Utils.donuts[0];
    DonutService donutService =
        Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.selectedDonut;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainDark,
        ),
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Image.network(AppImages.donutLogoRedText),
        actions: [
          DonutShoppingCartBadgeWidget(),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: RotationTransition(
                    turns: rotationAnimation!,
                    child: Image.network(
                      selectedDonut!.imgUrl!,
                      width: MediaQuery.of(context).size.width * 1,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          selectedDonut!.name!,
                          style: TextStyle(
                            color: AppColors.mainDark,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      IconButton(
                        icon: Icon(Icons.favorite_outline),
                        color: AppColors.mainDark,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: AppColors.mainDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "\$${selectedDonut!.price!.toStringAsFixed(2)}",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(selectedDonut!.description!),
                  Consumer<DonutShoppingCartService>(
                    builder: (context, cartService, child) {
                      if (!cartService.isDonutInCart(selectedDonut!)) {
                        return GestureDetector(
                          onTap: () {
                            cartService.addToCart(selectedDonut!);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainDark.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: AppColors.mainDark,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Add To Cart",
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_rounded,
                                color: AppColors.mainDark),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Added to Cart",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainDark),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
