import 'package:flutter_yumyum/model/cart_model.dart';

class OrderModel {
  String userId='',
  userName='',
  userPhone='',
  shippingAddress='',
  comment='',
  orderNumber='',
  restaurantId='';
  double totalPayment=0, finalPayment=0, shippingCost=0, discount=0;
  bool isCod=false;
  List<CartModel> cartItemList = List<CartModel>.empty(growable: true);
  int orderStatus=0, createdDate=0;


  OrderModel(
      this.userId,
      this.userName,
      this.userPhone,
      this.shippingAddress,
      this.comment,
      this.orderNumber,
      this.restaurantId,
      this.totalPayment,
      this.finalPayment,
      this.shippingCost,
      this.discount,
      this.isCod,
      this.cartItemList,
      this.orderStatus,
      this.createdDate);

  OrderModel.fromJson(Map<String, dynamic> json){
    userId=json['userId'];
    userName=json['userName'];
    userPhone=json['userPhone'];
    restaurantId=json['restaurantId'];
    shippingAddress=json['shippingAddress'];
    comment=json['comment'];
    orderNumber=json['orderNumber'];
    totalPayment=double.parse(json['totalPayment'].toString());
    finalPayment=double.parse(json['finalPayment'].toString());
    shippingCost=double.parse(json['shippingCost'].toString());
    discount=json['userId'];
    isCod=json['userId'] as bool;
    orderStatus=int.parse(json['orderStatus'].toString());
    if(json['cartItemList'] != null){
      json['cartItemList'].forEach((v){
        cartItemList.add(CartModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final data = Map<String, dynamic>();
    data['userId']=this.userId;
    data['userName']=this.userName;
    data['userPhone']=this.userPhone;
    data['shippingAddress']=this.shippingAddress;
    data['comment']=this.comment;
    data['orderNumber']=this.orderNumber;
    data['totalPayment']=this.totalPayment;
    data['finalPayment']=this.finalPayment;
    data['shippingCost']=this.shippingCost;
    data['discount']=this.discount;
    data['isCod']=this.isCod;
    data['orderStatus']=this.orderStatus;
    data['cartItemList']=this.cartItemList;
    data['restaurantId']=this.restaurantId;
    return data;
  }
}