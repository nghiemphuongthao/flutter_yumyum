import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_yumyum/const/const.dart';
import 'package:flutter_yumyum/model/restaurant_model.dart';

Future<List<RestaurantModel>> getRestaurantList() async{
  var list = List<RestaurantModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference().child(RESTAURANT_REF).once();
  var values = source.snapshot.value as Map<dynamic,dynamic>;
  RestaurantModel? restaurantModel;
  values.forEach((key,value){
    restaurantModel = RestaurantModel.fromJson(jsonDecode(jsonEncode(value)));
    restaurantModel!.restaurantId = key;
    list.add(restaurantModel!);
  });
  list.sort((a, b) => a.name.compareTo(b.name)); // Sort by the 'name' property
  return list;
}