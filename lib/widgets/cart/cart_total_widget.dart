import 'package:flutter/material.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/strings/cart_strings.dart';
import 'package:flutter_yumyum/utils/utils.dart';
import 'package:flutter_yumyum/widgets/cart/cart_total_item_widget.dart';
import 'package:get/get.dart';

class TotalWidget extends StatelessWidget {
  TotalWidget({
    required this.controller,
    super.key,
  });

  final CartStateController controller;
  final MainStateController mainStateController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(padding: const EdgeInsets.all(16),
        child: Column(children: [
          TotalItemWidget(
            text: totalText,
            value:currencyFormat.format(controller.sumCart(mainStateController.selectedRestaurant.value.restaurantId)),
            isSubTotal: false,
          ),
          Divider(thickness: 2,),
          TotalItemWidget(
            text: shippingFeeText,
            value:currencyFormat.format(controller.getShippingFee(mainStateController.selectedRestaurant.value.restaurantId)),
            isSubTotal: false,
          ),
          Divider(thickness: 2,),
          TotalItemWidget(
            text: subTotalText,
            value:currencyFormat.format(controller.getSubTotal(mainStateController.selectedRestaurant.value.restaurantId)),
            isSubTotal: true,
          ),
        ],),),
    );
  }
}
