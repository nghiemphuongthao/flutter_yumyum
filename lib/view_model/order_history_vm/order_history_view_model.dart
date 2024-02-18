import 'package:flutter_yumyum/model/order_model.dart';

abstract class OrderHistoryViewModel {
  Future<List<OrderModel>> getUserHistory(String restaurantId, String statusMode);
}