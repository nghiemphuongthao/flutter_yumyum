import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yumyum/model/addon_model.dart';
import 'package:flutter_yumyum/state/order_history_state.dart';
import 'package:flutter_yumyum/strings/cart_strings.dart';
import 'package:flutter_yumyum/strings/order_history_string.dart';
import 'package:flutter_yumyum/utils/utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderViewDetailScreen extends StatelessWidget{
  final OrderHistoryState  orderHistoryState = Get.find();
  var noSymbolUSFormat=new NumberFormat.currency(locale:'en_US');

  @override
  Widget build(BuildContext context) {
    var orderModel = orderHistoryState.selectedOrder.value;
    var chipBackgroundColor = convertStatusToColor(orderModel.orderStatus);
    var chipForegroundColor = chipBackgroundColor.computeLuminance()<0.5
        ?Colors.white
        :Colors.black;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Order ${orderModel.orderNumber}'),
        actions: [
          (orderModel.orderStatus==0 || orderModel.orderStatus==1)
          ? InkWell(
            child: Icon(Icons.clear),
            onTap: (){
              print('Cancel Order');
            },
          ) : Container()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Area of Order's info
          Expanded(flex:2, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${orderModel.userName.toUpperCase()}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,),
                      ),
                        Text(
                          '${orderModel.shippingAddress}',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),),
                        Text(
                          '${orderModel.userPhone}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,),
                        ),
                      ],
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Chip(
                          backgroundColor: chipBackgroundColor,
                            label: Text('${convertStatus(orderModel.orderStatus)}',
                            style: TextStyle(color: chipForegroundColor),))
                      ],
                    ),
                  ],
                ),
                Divider(thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(totalText, style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900
                    ),),
                    Text('${noSymbolUSFormat.format(orderModel.totalPayment)}', style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900
                    ),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(discountText, style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900
                    ),),
                    Text('${orderModel.discount}%', style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w900
                    ),)
                  ],
                ),
                Divider(thickness: 1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(finalText, style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900
                    ),),
                    Text('${noSymbolUSFormat.format(orderModel.finalPayment)}', style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900
                    ),)
                  ],
                ),
              ],
            ),
          )),
          SizedBox(height: 10 ),
          Expanded(flex: 3,
              child: ListView.builder(
                  itemCount: orderModel.cartItemList.length,
                  itemBuilder: (context, index){
                    var sizeText = orderModel.cartItemList[index]
                      .size.length>0?orderModel.cartItemList[index].size[0].name
                        :'';
                    var addonText = orderModel.cartItemList[index]
                        .addon.length>0?convertAddonToText(orderModel.cartItemList[index].addon)
                        :'';
                    var infoText='Quantity: ${orderModel.cartItemList[index].quantity}';
                    if(sizeText.length>0)
                      infoText+='\nSize: $sizeText';
                    if(addonText.length>0)
                      infoText+='\nAddon: $addonText';
                    return Card(
                      elevation: 8.0,
                      child: ListTile(
                        title: Text(orderModel.cartItemList[index].name),
                        leading: CachedNetworkImage(
                            imageUrl: orderModel.cartItemList[index].image,
                            imageBuilder: (context, provider)=> CircleAvatar(
                              backgroundImage: provider,
                            ),
                          placeholder: (context, url)=> Center(child: CircularProgressIndicator(),),
                          errorWidget: (context, url, err)=> Center(child: Icon(Icons.image),),
                        ),
                        isThreeLine: true,
                        subtitle: Text(''),
                      ),
                    );
                  })),
        ],
      ),
    )
    );
  }


}