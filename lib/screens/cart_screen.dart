import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:flutter_yumyum/model/cart_model.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/strings/cart_strings.dart';
import 'package:flutter_yumyum/view_model/cart_vm/cart_view_model_imp.dart';
import 'package:flutter_yumyum/widgets/cart/cart_image_widget.dart';
import 'package:flutter_yumyum/widgets/cart/cart_info_widget.dart';
import 'package:flutter_yumyum/widgets/cart/cart_total_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartDetailScreen extends StatelessWidget{
  final box = GetStorage();
  final CartStateController controller =Get.find();
  final CartViewModelImp cartViewModel = new CartViewModelImp();
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),actions: [

        controller.getQuantity(mainStateController.selectedRestaurant.value.restaurantId)>0
            ?IconButton(onPressed: () {
          Get.defaultDialog(
              title: clearCartConfirmTitleText,
              middleText: clearCartConfirmContentText,
              textCancel: cancelText,
              textConfirm: confirmText,
              onConfirm: ()=>cartViewModel.clearCart(controller)
          );},
            icon: Icon(Icons.clear))
            :Container()
      ],),
      body: controller.getQuantity(mainStateController.selectedRestaurant.value.restaurantId) >0
          ? Obx(()=> Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: controller.getCart(
                mainStateController.
                selectedRestaurant.value.restaurantId).length,
            itemBuilder: (context, index) => Slidable(
              child: Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 2,child: CartImageWidget(
                          cartModel: controller.getCart(mainStateController.selectedRestaurant.value.restaurantId)[index],
                          controller: controller)),
                      Expanded(flex: 6,child: CartInfo(cartModel: controller.getCart(mainStateController.selectedRestaurant.value.restaurantId)[index])),
                      Center(
                        child: ElegantNumberButton(
                            initialValue: controller.getCart(mainStateController.selectedRestaurant.value.restaurantId)[index].quantity,
                            minValue: 1,
                            maxValue: 100,
                            color: Colors.green,
                            onChanged:  (value) {
                              // Update quantity
                              cartViewModel.updateCart(controller,mainStateController.selectedRestaurant.value.restaurantId, index, value.toInt());
                            },
                            decimalPlaces: 0),)
                    ],
                  ),
                ),
              ),
              startActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (BuildContext context) {
                      Get.defaultDialog(
                          title: deleteCartConfirmTitleText,
                          middleText: deleteCartConfirmContentText,
                          textCancel: cancelText,
                          textConfirm: confirmText,
                          onConfirm: (){cartViewModel.deleteCart(controller,mainStateController.selectedRestaurant.value.restaurantId, index);
                          Get.back();
                          }
                      );
                    },
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  )
                ],
              ),
            ),
          )),
          TotalWidget(controller: controller,),
        ],
      ))
          : Center(child: Text(cartEmptyText),),
    );
  }
}