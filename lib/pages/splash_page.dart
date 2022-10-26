import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/pages/donut_shop_main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? donutController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this)
          ..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: donutController!, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    donutController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Utils.mainAppNav.currentState!.pushReplacementNamed("/main");
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: ((context) => DonutShopMain())));
    });

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: rotationAnimation!,
              child: Image.network(AppImages.donutLogoWhiteNoText,
                  width: 100, height: 100),
            ),
            Image.network(AppImages.donutLogoWhiteText,
                width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
