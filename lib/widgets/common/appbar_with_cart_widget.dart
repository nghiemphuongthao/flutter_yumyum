import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_yumyum/screens/cart_screen.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWithCartButton extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final CartStateController cartStateController = Get.find();
  final MainStateController mainStateController =Get.find();

  AppBarWithCartButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('$title',
          style: GoogleFonts.jetBrainsMono(color: Colors.black)),
      elevation: 10,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        Obx(()=>Badge(
          position: BadgePosition.topEnd(top: 0, end: 0),
          showBadge: true,
          badgeAnimation: BadgeAnimation.scale(animationDuration: Duration(milliseconds: 200)),
          badgeContent: Text(
              '${cartStateController.getQuantity(mainStateController.selectedRestaurant.value.restaurantId)}',
              style: TextStyle(color: Colors.white)),
          child: IconButton(
            onPressed: ()=> Get.to(()=>CartDetailScreen()),
            icon: Icon(Icons.shopping_bag),),
        )),
        SizedBox(width:25,)
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(56.0);
}