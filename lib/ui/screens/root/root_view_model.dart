import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/models/plants.dart';
import 'package:plant_app/ui/screens/cart/cart_screen.dart';
import 'package:plant_app/ui/screens/home/home_screen.dart';
import 'package:plant_app/ui/screens/profile/profile_screen.dart';

class RootViewModel extends ChangeNotifier {
  List<Plant> plantList = [
    Plant(
        plantId: 0,
        price: 22,
        size: 'small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 24',
        category: 'Indoor',
        plantName: 'Rose',
        imageUrl: 'asset/rose.png',
        isSelected: false,
        description: 'The Plant is one of the best Plant'),
    Plant(
        plantId: 1,
        price: 10,
        size: 'Medium',
        rating: 4.5,
        humidity: 44,
        temperature: '23 - 24',
        category: 'Indoor',
        plantName: 'Lily',
        imageUrl: 'asset/lilyy.png',
        isSelected: true,
        description:
            ' A white lily traditionally symbolizes modesty and new beginnings.'),
    Plant(
        plantId: 2,
        price: 22,
        size: 'Large',
        rating: 4.5,
        humidity: 40,
        temperature: '23 - 24',
        category: 'Outdoor',
        plantName: 'SunFlower',
        imageUrl: 'asset/sunflower.png',
        isSelected: false,
        description: 'It\'s one of the best flower '),
    Plant(
        plantId: 3,
        price: 22,
        size: 'medium',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 24',
        category: 'Indoor',
        plantName: 'Lily',
        imageUrl: 'asset/tulip.png',
        isSelected: false,
        description:
            'Tulips are erect flowers with long, broad, parallel-veined leaves '),
    Plant(
        plantId: 4,
        price: 22,
        size: 'Large',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 24',
        category: 'Outdoor',
        plantName: 'Grape Plant',
        imageUrl: 'asset/grape.png',
        isSelected: false,
        description:
            'fleshy, rounded fruits that grow in clusters made up of many fruits of greenish, yellowish or purple skin'),
  ];

  List<Plant> myCart = [];
  int bottomNaviIndex = 0;
  //list of the screens or pages
  List<Widget> widgetOptions() {
    return [
      const HomeScreen(),
      const ProfileScreen(),
      CartSection(addedToCartPlants: myCart),
    ];
  }

  //list of the pages or screens icons
  List<IconData> iconList = [
    Icons.home,
    Icons.person,
    Icons.shopping_cart,
    Icons.list_alt_outlined,
  ];
  //list of the pages or screens titles
  List<String> titleList = [
    'Home',
    'Profile',
    'Product Details',
    'Cart',
  ];

  get plants => plantList;

  List<Plant> addedToCartPlants() {
    return plantList.where((element) => element.isSelected == true).toList();
  }

  onTap(int index) {
    bottomNaviIndex = index;
    myCart = addedToCartPlants();
    notifyListeners();
  }
}
