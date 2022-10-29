import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RootViewModel>(
      builder: (context, model, child) => Scaffold(
        body: IndexedStack(
          index: model.bottomNaviIndex,
          children: model.widgetOptions(),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          splashColor: kDarkgreenColor,
          activeColor: greenColor,
          inactiveColor: kBlackColor,
          icons: model.iconList,
          activeIndex: model.bottomNaviIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: ((index) {
            model.onTap(index);
          }),
        ),
      ),
    );
  }
}
