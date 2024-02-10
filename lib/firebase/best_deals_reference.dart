import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_yumyum/const/const.dart';
import 'package:flutter_yumyum/model/popular_item_model.dart';

Future<List<PopularItemModel>> getBestDealByRestaurantId(String restaurantId) async{
  var list = List<PopularItemModel>.empty(growable: true);
  var source = await FirebaseDatabase.instance.reference()
      .child(RESTAURANT_REF)
      .child(restaurantId)
      .child(BEST_DEALS_REF)
      .once();

  var values = source.snapshot.value as Map<dynamic,dynamic>;
  values.forEach((key,value){
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}