import 'package:flutter_yumyum/firebase/server_user_reference.dart';
import 'package:flutter_yumyum/model/server_user_model.dart';
import 'package:flutter_yumyum/state/server_manager_state.dart';
import 'package:flutter_yumyum/view_model/manager_restaurant_vm/manager_restaurant_view_model.dart';
import 'package:get/get.dart';

class ManagerRestaurantViewModelImp implements ManagerRestaurantViewModel{
  ServerManagerState serverManagerState = Get.find();
  @override
  void registerServerUser(ServerUserModel serverUserModel) async{
    var result = await writeServerUserToFirebase(serverUserModel);
    if(result){
      serverManagerState.isServerLogin.value=await checkIsServerUser(serverUserModel.uid);
      Get.back();
    }
  }

}