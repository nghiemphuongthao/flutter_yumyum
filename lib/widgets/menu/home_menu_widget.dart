import 'package:flutter/material.dart';
import 'package:flutter_yumyum/strings/restaurant_home_strings.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({
    super.key,
    required this.zoomDrawerController,
  });

  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=>zoomDrawerController.toggle!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.home_filled, color: Colors.white),
            SizedBox(width: 20,),
            Text(homeText, style: GoogleFonts.jetBrainsMono(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900),)
          ],),
      ),);
  }
}