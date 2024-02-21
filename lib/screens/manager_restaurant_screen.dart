import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yumyum/firebase/server_user_reference.dart';
import 'package:flutter_yumyum/model/server_user_model.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/state/server_manager_state.dart';
import 'package:flutter_yumyum/strings/manager_restaurant_string.dart';
import 'package:flutter_yumyum/strings/place_order_string.dart';
import 'package:flutter_yumyum/strings/restaurant_home_strings.dart';
import 'package:flutter_yumyum/view_model/manager_restaurant_vm/manager_restaurant_view_model.dart';
import 'package:flutter_yumyum/view_model/manager_restaurant_vm/manager_restaurant_view_model_imp.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class ManagerRestaurantScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ManagerRestaurantScreenState();
}

class ManagerRestaurantScreenState extends State<ManagerRestaurantScreen>{
  ServerManagerState serverManagerState= Get.put(ServerManagerState());
  MainStateController mainStateController=Get.find();

  ManagerRestaurantViewModel managerRestaurantViewModel = new ManagerRestaurantViewModelImp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      var result = await checkIsServerUser(FirebaseAuth.instance.currentUser!.uid);
      serverManagerState.isServerLogin.value=result;
      if(!result) //If user not login
        showRegisterDialog();
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(managerRestaurantText),),
      body: Center(
        child: Text('Is Server Login: ${serverManagerState.isServerLogin.value}'),),
    );
  }

  void showRegisterDialog() {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final formKey=GlobalKey<FormState>();
    Get.defaultDialog(
      title: registerManagerText,
      content: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: TextFormField(
                    controller: firstNameController,
                    validator: ValidationBuilder(requiredMessage: '$firstNameText $isRequiredText').required().build(),
                    decoration: InputDecoration(
                      hintText: firstNameText,
                      label: Text(firstNameText),
                      border: OutlineInputBorder()
                    ),
                  )),
                  SizedBox(width: 8,),
                  Expanded(child: TextFormField(
                    controller: lastNameController,
                    validator: ValidationBuilder(requiredMessage: '$lastNameText $isRequiredText').required().build(),
                    decoration: InputDecoration(
                        hintText: lastNameText,
                        label: Text(lastNameText),
                        border: OutlineInputBorder()
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
      textConfirm: registerText,
      textCancel: cancelText,
      confirmTextColor: Colors.white,
      onConfirm: () async{
        ServerUserModel serverUserModel = new ServerUserModel('${firstNameController.text} ${lastNameController.text}',
            mainStateController.selectedRestaurant.value.restaurantId,
            FirebaseAuth.instance.currentUser!.uid,
            FirebaseAuth.instance.currentUser!.phoneNumber.toString());
        managerRestaurantViewModel.registerServerUser(serverUserModel);
      }
    );
  }
}