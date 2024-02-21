import 'package:flutter/material.dart';
import 'package:flutter_yumyum/strings/restaurant_home_strings.dart';

class ManagerRestaurantScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ManagerRestaurantScreenState();
}

class ManagerRestaurantScreenState extends State<ManagerRestaurantScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(managerRestaurantText),),
      body: Center(child: Text('Hello'),),
    );
  }
}