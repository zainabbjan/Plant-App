import 'package:flutter/cupertino.dart';
import 'package:plant_app/core/models/plants.dart';
import 'package:plant_app/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  final List<String> _plantTypes = [
    'Recommended',
    'Top',
    'Indoor',
    'Outdoor',
    'Garden',
    'Suplement',
  ];
  get platTypes => _plantTypes;
  List<Plant>? plants;
  bool isDataLoaded = false;
  BuildContext? context;

  HomeViewModel(this.context) {
    init();
  }

  init() {
    plants = Provider.of<RootViewModel>(context!, listen: false).plantList;
    isDataLoaded = true;
    notifyListeners();
  }

}
