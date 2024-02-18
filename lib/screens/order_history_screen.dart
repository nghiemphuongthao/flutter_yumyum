import 'package:flutter/material.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/strings/main_strings.dart';
import 'package:flutter_yumyum/utils/const.dart';
import 'package:flutter_yumyum/view_model/order_history_vm/order_history_view_model_imp.dart';
import 'package:flutter_yumyum/widgets/order_history/order_history_widget.dart';
import 'package:get/get.dart';

class OrderHistory extends StatelessWidget{
  final vm = new OrderHistoryViewModelImp();
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        title: Text(orderHistoryText),
        bottom: TabBar(tabs: [
          Tab(icon: Icon(Icons.cancel_outlined)),
          Tab(icon: Icon(Icons.refresh)),
          Tab(icon: Icon(Icons.check))
        ],),
      ),
      body: TabBarView(
        children: [
          OrderHistoryWidget(vm, mainStateController, ORDER_CANCELLED),
          OrderHistoryWidget(vm, mainStateController, ORDER_PROCESSING),
          OrderHistoryWidget(vm, mainStateController, ORDER_SHIPPED),
        ],
      ),
    ),));
  }

}