import 'package:flutter_yumyum/firebase/restaurant_reference.dart';
import 'package:flutter_yumyum/model/restaurant_model.dart';
import 'package:flutter_yumyum/view_model/main_vm/main_view_model.dart';

class MainViewModelImp implements MainViewModel {
  @override
  Future<List<RestaurantModel>> displayRestaurantList() {
    return getRestaurantList();
  }

}