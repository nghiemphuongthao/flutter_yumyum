import 'package:flutter_yumyum/model/order_model.dart';
import 'package:flutter_yumyum/state/cart_state.dart';

abstract class ProcessOrderViewModel {
  Future<bool> submitOrder(OrderModel orderModel);
  Future<OrderModel> createOrderModel(
      {required String restaurantId,
        required double discount,
        required String firstName,
        required String lastName,
        required String address,
        required String comment,
        required bool isCod,
        required CartStateController cartStateController});
}