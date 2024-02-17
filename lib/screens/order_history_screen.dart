import 'package:flutter/material.dart';
import 'package:flutter_yumyum/model/order_model.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/strings/main_strings.dart';
import 'package:flutter_yumyum/view_model/order_history_vm/order_history_view_model_imp.dart';
import 'package:get/get.dart';

class OrderHistory extends StatelessWidget{
  final vm = new OrderHistoryViewModelImp();
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(orderHistoryText)),
        body: FutureBuilder<List<OrderModel>>(
          future: vm.getUserHistory(mainStateController.selectedRestaurant.value.restaurantId),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              var lst = snapshot.data!;
              if (lst.isNotEmpty) {
                return Center(child: Text('Your order is ${lst.length}'));
              } else {
                return Center(child: Text('No orders available'));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error.toString()}'));
            } else {
              return Center(child: Text('No order data available'));
            }
          },
        ),
      ),
    );
  }
}