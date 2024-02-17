import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_yumyum/const/const.dart';
import 'package:flutter_yumyum/model/order_model.dart';

Future<bool> writeOrderToFirebase (OrderModel orderModel) async{
  try{
    await FirebaseDatabase.instance
        .reference()
        .child(RESTAURANT_REF)
        .child(orderModel.restaurantId)
        .child(ORDER_REF)
        .child(orderModel.orderNumber)
        .set(orderModel.toJson());
    return true;
  }catch(e){
    print(e);
    return false;
  }
}
