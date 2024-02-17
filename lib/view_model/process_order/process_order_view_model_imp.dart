import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_yumyum/firebase/order_reference.dart';
import 'package:flutter_yumyum/firebase/server_time_offset_reference.dart';
import 'package:flutter_yumyum/model/order_model.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/strings/place_order_string.dart';
import 'package:flutter_yumyum/utils/utils.dart';
import 'package:flutter_yumyum/view_model/process_order/process_order_view_model.dart';
import 'package:get_storage/get_storage.dart';

class ProcessOrderViewModelImp extends ProcessOrderViewModel{
  @override
  Future<bool> submitOrder(OrderModel orderModel) {
    return writeOrderToFirebase(orderModel);
  }

  @override
  Future<OrderModel> createOrderModel(
      {required String restaurantId,
      required double discount,
      required String firstName,
      required String lastName,
      required String address,
      required String comment,
      required bool isCod,
      required CartStateController cartStateController}) async{
    var serverTime= await getServerTimeOffset();
    return new OrderModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName:'$firstName $lastName',
        userPhone:FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
        shippingAddress: address,
        comment:comment,
        orderNumber:createOrderNumber(serverTime).toString(),
        restaurantId:restaurantId,
        totalPayment: cartStateController.getSubTotal(restaurantId),
        finalPayment:calculateFinalPayment(cartStateController.getSubTotal(restaurantId), discount),
        shippingCost:cartStateController.getShippingFee(restaurantId),
        discount:discount,
        isCod: isCod,
        cartItemList: cartStateController.getCart(restaurantId),
        orderStatus:0,
        createdDate: serverTime);
  }
  
}