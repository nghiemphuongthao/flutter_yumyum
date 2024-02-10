import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/view_model/cart_vm/cart_view_model.dart';
import 'package:get/get.dart';

class CartViewModelImp implements CartViewModel{

  final MainStateController mainStateController=Get.find();

  void updateCart(CartStateController controller,String restaurantId, int index, int value){
    controller.cart.value = controller.getCart(restaurantId);
    controller.cart[index].quantity= value.toInt();
    controller.cart.refresh();
    controller.saveDatabase();
  }

  void deleteCart(CartStateController controller,String restaurantId, int index){
    controller.cart.value = controller.getCart(restaurantId);
    controller.cart.removeAt(index);
    controller.saveDatabase();
  }

  void clearCart(CartStateController controller){
    controller.cart.clear();
  }
}