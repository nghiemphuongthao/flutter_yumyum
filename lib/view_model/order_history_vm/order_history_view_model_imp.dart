import 'package:flutter_yumyum/firebase/order_reference.dart';
import 'package:flutter_yumyum/model/order_model.dart';
import 'package:flutter_yumyum/view_model/order_history_vm/order_history_view_model.dart';

class OrderHistoryViewModelImp extends OrderHistoryViewModel{
  @override
  Future<List<OrderModel>> getUserHistory(String restaurantId) {
    return getUserOrdersByRestaurant(restaurantId);
  }
  
}