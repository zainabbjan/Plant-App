import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

import '../../../core/models/plants.dart';

class ProductDetailSection extends StatefulWidget {
  final int plantId;
  const ProductDetailSection({super.key, required this.plantId});

  @override
  State<ProductDetailSection> createState() => _ProductDetailSectionState();
}

class _ProductDetailSectionState extends State<ProductDetailSection> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    List<Plant> _plantList =
        Provider.of<RootViewModel>(context, listen: false).plants;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: klightgreenColor,
      body: Stack(
        children: [
          Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: kDarkgreenColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favourite');
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white),
                      child: Icon(
                        _plantList[widget.plantId].isSelected == true
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: kDarkgreenColor,
                      ),
                    ),
                  )
                ],
              )),
          Positioned(
            top: 2,
            left: 50,
            right: 50,
            child: Container(
              width: size.width * .8,
              height: size.height * .9,
              padding: const EdgeInsets.only(bottom: 70),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageUrl),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: TextStyle(
                                color: kDarkgreenColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Text(
                                r'$' +
                                    _plantList[widget.plantId].price.toString(),
                                style: const TextStyle(
                                  color: kDarkgreenColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          color: kDarkgreenColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.add),
                            const Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 30.0),
                              child: Icon(Icons.minimize),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kDarkgreenColor,
                    ),
                  ),
                  Text(
                    _plantList[widget.plantId].description,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        height: 1.5, fontSize: 10, color: Colors.green[900]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 80,
                    child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 70.0,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            margin: const EdgeInsets.only(bottom: 10, top: 10),
                            width: size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage: const AssetImage(
                                    'asset/height.png',
                                  ),
                                  backgroundColor: Colors.green[900],
                                ),
                                PlantFeatures(
                                  title: 'Size',
                                  plantFeatures:
                                      _plantList[widget.plantId].size,
                                ),
                                CircleAvatar(
                                  backgroundImage: const AssetImage(
                                    'asset/hmi.png',
                                  ),
                                  backgroundColor: kDarkgreenColor,
                                ),
                                PlantFeatures(
                                  title: 'Humidity',
                                  plantFeatures: _plantList[widget.plantId]
                                      .humidity
                                      .toString(),
                                ),
                                CircleAvatar(
                                  backgroundImage: const AssetImage(
                                    'asset/temp.png',
                                  ),
                                  backgroundColor: kDarkgreenColor,
                                ),
                                PlantFeatures(
                                  title: 'Temperature',
                                  plantFeatures:
                                      _plantList[widget.plantId].temperature,
                                )
                              ],
                            ),
                          );
                        })),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                onPressed: (() {
                  setState(() {
                    bool isSelected =
                        toggleIsSelected(_plantList[widget.plantId].isSelected);

                    _plantList[widget.plantId].isSelected = isSelected;
                  });
                }),
                icon: Icon(
                  Icons.shopping_cart,
                  color: _plantList[widget.plantId].isSelected == true
                      ? Colors.white
                      : Colors.green,
                ),
              ),
              decoration: BoxDecoration(
                  color: _plantList[widget.plantId].isSelected == true
                      ? Colors.green
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    const BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.green,
                    ),
                  ]),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.green,
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeatures extends StatelessWidget {
  final String plantFeatures;
  final String title;
  const PlantFeatures(
      {Key? key, required this.plantFeatures, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(
            color: kDarkgreenColor,
          ),
        ),
        Text(
          plantFeatures,
          style: TextStyle(
            fontSize: 10.0,
            color: kDarkgreenColor,
          ),
        )
      ],
    );
  }
}
