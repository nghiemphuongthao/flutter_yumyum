import 'package:flutter/material.dart';
import 'package:flutter_yumyum/state/place_order_state.dart';
import 'package:flutter_yumyum/strings/place_order_string.dart';
import 'package:flutter_yumyum/utils/const.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrderScreen extends StatelessWidget{
  var placeOrderState = Get.put(PlaceOrderController());
  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Scaffold(
     appBar: AppBar(
       title: Text(placeOrderText),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8),
       child:Column(
         children: [
           Row(children: [
             Expanded(child: TextField(
               decoration: InputDecoration(
                 hintText: firstNameText,
                 label: Text(firstNameText),
                 border: OutlineInputBorder(),
               ),
             ),),
             SizedBox(width: 8,),
             Expanded(child: TextField(
               decoration: InputDecoration(
                 hintText: lastNameText,
                 label: Text(lastNameText),
                 border: OutlineInputBorder(),
               ),
             ),),
           ],),
           SizedBox(height: 8,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextField(
                 decoration: InputDecoration(
                   hintText: addressText,
                   label: Text(addressText),
                   border: OutlineInputBorder(),
                 ),
               )
             ],
           ),
           SizedBox(height: 8,),
           Obx(() => Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(paymentText,
                 style: GoogleFonts.jetBrainsMono(fontSize: 24, fontWeight: FontWeight.w900),
                 textAlign: TextAlign.left,),
               RadioListTile<String>(
                   title: const Text(codText),
                   value: COD_VAL,
                   groupValue: placeOrderState.paymentSelected.value,
                   onChanged: (String? val){placeOrderState.paymentSelected.value=val!;
                   }),
               RadioListTile<String>(
                   title: const Text(braintreeText),
                   value: BRAINTREE_VAL,
                   groupValue: placeOrderState.paymentSelected.value,
                   onChanged: (String? val){placeOrderState.paymentSelected.value=val!;
                   })
             ],
           )),
           SizedBox(height: 8,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               TextField(
                 decoration: InputDecoration(
                   hintText: commentText,
                   label: Text(commentText),
                   border: OutlineInputBorder(),
                 ),
               )
             ],
           ),
           Spacer(),
           Container(
             width: double.infinity,
             child: ElevatedButton(child: Text(placeOrderText),onPressed: (){} ,),
           )
         ],
       ),
     ),
     ),
   );
  }

}