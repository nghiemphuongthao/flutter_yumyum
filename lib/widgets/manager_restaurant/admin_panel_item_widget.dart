import 'package:flutter/material.dart';

class AdminPanelItemWidget extends StatelessWidget{
  final IconData? icon;
  final String? text;
  final bool? isExitWidget; //If menu item is exit, we will have twice Navigator.pop to back to Home

  AdminPanelItemWidget({Key? key, this.icon, this.text, this.isExitWidget}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$text'),
      leading: Icon(icon),
      onTap: (){
        Navigator.pop(context);
        if(isExitWidget!) Navigator.pop(context);
      },
    );
  }
}