import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_yumyum/state/food_list_state.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailDescriptionWidget extends StatelessWidget {
  const FoodDetailDescriptionWidget({
    super.key,
    required this.foodListStateController,
  });

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemBuilder: (context, _){
                  return Icon(Icons.favorite, color: Colors.red,);
                },
                onRatingUpdate: (value){}),
            SizedBox(height: 10,),
            Text('${foodListStateController.selectedFood.value.description}',
              style: GoogleFonts.jetBrainsMono(color: Colors.blueGrey,
                  fontSize: 14),)
          ],
        ),
      ),
    );
  }
}