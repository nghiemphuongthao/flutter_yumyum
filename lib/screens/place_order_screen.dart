import 'package:flutter/material.dart';
import 'package:flutter_yumyum/state/place_order_state.dart';
import 'package:flutter_yumyum/strings/place_order_string.dart';
import 'package:flutter_yumyum/utils/const.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrderScreen extends StatelessWidget{
  final placeOrderState = Get.put(PlaceOrderController());

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(placeOrderText),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child:Column(
            children: [
              Row(children: [
                Expanded(child: TextFormField(
                  controller: firstNameController,
                  validator: ValidationBuilder(requiredMessage: '$firstNameText $isRequiredText')
                      .required().build(),
                  decoration: InputDecoration(
                    hintText: firstNameText,
                    label: Text(firstNameText),
                    border: OutlineInputBorder(),
                  ),
                ),),
                SizedBox(width: 8,),
                Expanded(child: TextFormField(
                  controller: lastNameController,
                  validator: ValidationBuilder(requiredMessage: '$lastNameText $isRequiredText')
                      .required().build(),
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
                  TextFormField(
                    controller: addressController,
                    validator: ValidationBuilder(requiredMessage: '$addressText $isRequiredText')
                        .required().build(),
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
                  TextFormField(
                    controller: commentController,
                    validator: ValidationBuilder(requiredMessage: '$commentText $isRequiredText')
                        .required().build(),
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
                child: ElevatedButton(
                  child: Text(placeOrderText),
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      print('OK');
                    }
                  } ,),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}