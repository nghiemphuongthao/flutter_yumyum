import 'package:flutter/material.dart';
import 'package:flutter_yumyum/state/order_history_state.dart';
import 'package:get/get.dart';

class OrderViewDetailScreen extends StatelessWidget{
  final OrderHistoryState  orderHistoryState = Get.find();
  @override
  Widget build(BuildContext context) {
    var orderModel = orderHistoryState.selectedOrder.value;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Order ${orderModel.orderNumber}'),
        actions: [
          (orderModel.orderStatus==0 || orderModel.orderStatus==1)
          ? InkWell(
            child: Icon(Icons.clear),
            onTap: (){},
          ) : Container()
        ],
      ),
      body: Center(child: Text('Order Detail '),),
    )
    );
  }
}