import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yumyum/const/const.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/state/food_detail_state.dart';
import 'package:flutter_yumyum/state/food_list_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/utils/utils.dart';
import 'package:get/get.dart';


class FoodDetailImageWidget extends StatelessWidget {
  final CartStateController cartStateController = Get.find();
  final FoodDetailStateController foodDetailStateController = Get.find();
  final MainStateController mainStateController =Get.find();

  FoodDetailImageWidget({
    Key ? key,
    required this.foodListStateController,
  }) : super(key:key);

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(width: double.infinity,
        height: foodDetailImageAreaSize(context)*0.9,
        child: Hero(
          tag: foodListStateController.selectedFood.value.name,
          child: CachedNetworkImage(
            imageUrl: foodListStateController.selectedFood.value.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, err)=> Center(child: Icon(Icons.image),),
            progressIndicatorBuilder: (context, url,downloadProgress)=> Center(child: CircularProgressIndicator(),),
          ),),
      ),
      Align(
        alignment: const Alignment(0.8, 1.0),
        heightFactor: 0.5,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: FAB_FAV_TAG,
                onPressed: (){},
                child: Icon(Icons.favorite_border),
                backgroundColor: Colors.white,
                elevation: 10,

              ),
              FloatingActionButton(
                heroTag: FAB_CART_TAG,
                onPressed: () => cartStateController.addToCart(
                  foodListStateController.selectedFood.value,
                  mainStateController.selectedRestaurant.value.restaurantId,
                  quantity: foodDetailStateController.quantity.value,
                ),
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.white,
                elevation: 10,

              )
            ],
          ),
        ),
      )
    ],);
  }
}