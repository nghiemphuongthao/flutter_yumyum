import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidget extends StatelessWidget {
  final String menuName;
  final VoidCallback callback;
  final IconData icon;

  const MenuWidget({
    super.key,
    required this.menuName,
    required this.callback,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: callback,
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