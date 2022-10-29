import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

import '../../core/models/plants.dart';
import '../screens/detail/product_details_screen.dart';

class PlantWidget extends StatelessWidget {
  const PlantWidget({
    Key? key,
    required this.index,
    required this.plantList,
  }) : super(key: key);

  final int index;
  final List<Plant> plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<RootViewModel>(builder: (context, model, child) {
      List<Plant> _plantList = model.plants;
      return GestureDetector(
        onTap: (() {
          Navigator.push(
              context,
              PageTransition(
                  child: ProductDetailSection(
                    plantId: _plantList[index].plantId,
                  ),
                  type: PageTransitionType.bottomToTop));
        }),
        child: Container(
          decoration: BoxDecoration(
            color: klightgreenColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 70.0,
          padding: const EdgeInsets.only(left: 10, top: 10),
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        shape: BoxShape.rectangle),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 50.0,
                      child: Image.asset(_plantList[index].imageUrl),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      left: 80,
                      child: Column(
                        children: [
                          Text(
                            _plantList[index].category,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kDarkgreenColor,
                            ),
                          ),
                          Text(
                            _plantList[index].plantName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kDarkgreenColor,
                            ),
                          )
                        ],
                      )),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  r'$' + _plantList[index].price.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
