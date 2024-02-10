import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yumyum/screens/menu.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'restaurant_home_detail.dart';


class RestaurantHome extends StatelessWidget{
  final drawerZoomController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ZoomDrawer(
        controller: drawerZoomController,
        menuScreen: MenuScreen(drawerZoomController),
        mainScreen: RestaurantHomeDetail(drawerZoomController),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        menuBackgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width*0.75,
        openCurve: Curves.bounceInOut,
        closeCurve: Curves.ease,
      ),
    ));
  }
}
