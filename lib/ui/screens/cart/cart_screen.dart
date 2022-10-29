import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/root/root_screen.dart';
import 'package:plant_app/ui/screens/home/home_screen.dart';
import 'package:plant_app/ui/widgets/plant_widgets.dart';

import '../../../core/models/plants.dart';

class CartSection extends StatefulWidget {
  final List<Plant> addedToCartPlants;

  const CartSection({super.key, required this.addedToCartPlants});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // body: widget.addedToCartPlants.isEmpty
        //     ? Center(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             SizedBox(
        //               height: 100,
        //               child: Image.asset('asset/cart.png'),
        //             ),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Text(
        //               'Your Cart is empty',
        //               style: TextStyle(
        //                   color: Colors.green[900],
        //                   fontWeight: FontWeight.w300),
        //             ),
        //           ],
        //         ),
        //       )
        //     :
        body: Stack(children: [
      Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const RootPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: klightgreenColor),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: kDarkgreenColor,
                  ),
                ),
              ),
              Text(
                'My Cart',
                style: TextStyle(color: Colors.green[900], fontSize: 20),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: klightgreenColor),
                child: Icon(
                  Icons.more_vert,
                  color: kDarkgreenColor,
                ),
              )
            ],
          )),
      Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: widget.addedToCartPlants.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((BuildContext context, index) {
                      return PlantWidget(
                          index: index, plantList: widget.addedToCartPlants);
                    })),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.only(
                            bottom: 30, left: 10, right: 10),
                        height: 300,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Subtotal:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    r'$0.00',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Shipping Cost:',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    r'$10',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 2.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Totals',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    r'$0.00',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.green[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  height: 50,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: kDarkgreenColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    ' Place your order',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: kDarkgreenColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                      child: Text(
                    ' Place your order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    ]));
  }
}
