import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/cart/cart_screen.dart';
import 'package:plant_app/ui/screens/detail/product_details_screen.dart';
import 'package:plant_app/ui/screens/home/home_view_model.dart';
import 'package:plant_app/ui/widgets/plant_widgets.dart';
import 'package:provider/provider.dart';

import '../../../core/models/plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return HomeViewModel(context);
      },
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              // title: Text('Home'),

              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: kDarkgreenColor,
                    child: IconButton(
                        onPressed: (() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  // ignore: prefer_const_constructors
                                  child: CartSection(
                                    addedToCartPlants: [],
                                  ),
                                  type: PageTransitionType.bottomToTop));
                        }),
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        )),
                  ),
                )
              ],
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('asset/images.jpg'),
                ),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0.0,
            ),
            body: !model.isDataLoaded
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              'Let\'s find your \nplants! ',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                width: size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: Colors.black54.withOpacity(0.6),
                                    ),
                                    const Expanded(
                                        child: TextField(
                                      showCursor: false,
                                      decoration: InputDecoration(
                                        hintText: 'Search Plant',
                                        border: InputBorder.none,
                                        //  focusedBorder: InputBorder.none,
                                      ),
                                    )),
                                    Icon(
                                      Icons.mic,
                                      color: Colors.black54.withOpacity(0.6),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 50.0,
                          width: size.width,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.platTypes.length,
                              itemBuilder: ((BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      model.selectedIndex = index;
                                    },
                                    child: Text(
                                      model.platTypes[index],
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: model.selectedIndex == index
                                            ? FontWeight.bold
                                            : FontWeight.w300,
                                        color: model.selectedIndex == index
                                            ? Colors.green
                                            : Colors.black54,
                                      ),
                                    ),
                                  ),
                                );
                              })),
                        ),
                        SizedBox(
                          height: size.height * .3,
                          child: ListView.builder(
                              itemCount: model.plants!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((BuildContext context, index) {
                                return GestureDetector(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: ProductDetailSection(
                                              plantId:
                                                  model.plants![index].plantId,
                                            ),
                                            type: PageTransitionType
                                                .bottomToTop));
                                  }),
                                  child: Container(
                                    width: 180,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.green[300],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            ClipPath(
                                              clipper: MyClipper(),
                                              child: Container(
                                                height: 230,
                                                decoration: BoxDecoration(
                                                  color: klightgreenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                left: 30,
                                                right: 30,
                                                top: -110,
                                                bottom: 0,
                                                child: Container(
                                                  height: 300,
                                                  width: 160,
                                                  child: Image.asset(model
                                                      .plants![index].imageUrl),
                                                )),
                                            Positioned(
                                              bottom: 15,
                                              left: 20,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    model.plants![index]
                                                        .category,
                                                    style: TextStyle(
                                                      color: kDarkgreenColor,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    model.plants![index]
                                                        .plantName,
                                                    style: const TextStyle(
                                                      color: kDarkgreenColor,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 15,
                                              right: 20,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  r'$' +
                                                      model.plants![index].price
                                                          .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              })),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 16, bottom: 10, top: 10),
                          child: const Text(
                            'Recent Viewed',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: size.height * .3,
                          child: ListView.builder(
                              itemCount: model.plants!.length,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: ((BuildContext context, index) {
                                return PlantWidget(
                                  index: index,
                                  plantList: model.plants!,
                                );
                              })),
                        )
                      ],
                    ),
                  )),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30.0);
    var p1 = Offset(size.width / 1.45, size.height);
    var p2 = Offset(size.width - 0.01, size.height - 115.0);

    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
