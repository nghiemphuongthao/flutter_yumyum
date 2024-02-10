import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_yumyum/screens/cart_screen.dart';
import 'package:flutter_yumyum/screens/category.dart';
import 'package:flutter_yumyum/screens/restaurant_home.dart';
import 'package:flutter_yumyum/state/cart_state.dart';
import 'package:flutter_yumyum/strings/main_strings.dart';
import 'package:flutter_yumyum/utils/const.dart';
import 'package:flutter_yumyum/view_model/menu_vm/menu_viewmodel.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';

class MenuViewModelImp implements MenuViewModel{
  final cartState=Get.put(CartStateController());
  @override
  void navigateCategories() {
    Get.to(()=>CategoryScreen());
  }

  @override
  void backToRestaurantList() {
    Get.back(closeOverlays: true, canPop:false);
  }

  @override
  bool checkLoginState(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null ?true:false;
  }

  @override
  void login(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if(user == null){
      FlutterAuthUi.startUi(items: [AuthUiProvider.phone],
        tosAndPrivacyPolicy: TosAndPrivacyPolicy(
          tosUrl: 'https://www.google.com',
          privacyPolicyUrl: 'https://www.youtube.com',),
        androidOption: AndroidOption(
            enableSmartLock: false,
            showLogo: true,
            overrideTheme: true
        )).then((value) async{
          navigationHome(context);
      }).catchError((e){
        Get.snackbar('Error', '$e');
      });
    }else{

    }
  }

  @override
  void logout(BuildContext context) {

    Get.defaultDialog(
      title: logoutTitle,
      content: Text(logoutText),
      backgroundColor: Colors.white,
      cancel: ElevatedButton(onPressed: ()=>Get.back(), child: Text(cancelText)),
      confirm: ElevatedButton(onPressed: (){
          FirebaseAuth.instance.signOut().then((value) => Get.offAll(RestaurantHome()));},
          child: Text(confirmText)),
    );
  }

  @override
  void navigationHome(BuildContext context) {
    var token = FirebaseAuth.instance.currentUser!
        .getIdToken();
    var box=GetStorage();
    //Save token use for send notification
    box.write(KEY_TOKEN, token);
    //Clone Cart
    if(cartState.cart.length>0) //if not empty
      {
        var newCart = cartState.getCartAnonymous(KEY_ANONYMOUS); //Only for KEY_ANONYMOUS, otherwise it will clone all account
        newCart.forEach((element) =>
          element.userUid==FirebaseAuth.instance.currentUser!.uid); // update Userid
        cartState.cart.addAll(newCart); //add to global cart
        cartState.saveDatabase(); // save
    }
  }
  
  

  void navigateCart() => Get.to(()=>CartDetailScreen());
}