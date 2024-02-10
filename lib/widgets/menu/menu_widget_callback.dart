import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidgetCallback extends StatelessWidget {
  final String menuName;
  final Function(BuildContext context) callback;
  final IconData icon;

  const MenuWidgetCallback({
    super.key,
    required this.menuName,
    required this.callback,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=>callback(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 20,),
            Text(menuName, style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900),)
          ],),
      ),);
  }
}