import 'package:flutter_yumyum/model/addon_model.dart';
import 'package:flutter_yumyum/model/size_model.dart';
import 'package:get/get.dart';

class FoodDetailStateController extends GetxController{
  var quantity =1.obs;
  var selectedSize = SizeModel(name: 'name', price: 0).obs;
  var selectedAddon = List<AddonModel>.empty(growable: true).obs;
}