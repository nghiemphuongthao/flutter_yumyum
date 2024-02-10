import 'package:flutter/material.dart';
import 'package:flutter_yumyum/model/category_model.dart';
import 'package:flutter_yumyum/state/category_state.dart';
import 'package:flutter_yumyum/state/main_state.dart';
import 'package:flutter_yumyum/view_model/category_vm/category_viewmodel_imp.dart';
import 'package:flutter_yumyum/widgets/category/category_list_widget.dart';
import 'package:flutter_yumyum/widgets/common/appbar_with_cart_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget{
  final viewModel = CategoryViewModelImp();
  final MainStateController mainStateController = Get.find();
  final CategoryStateController categoryStateController = Get.put(CategoryStateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWithCartButton(title: '${mainStateController.selectedRestaurant.value.name}'),
        body: FutureBuilder(
          future: viewModel.displayCategoryByRestaurantId(
              mainStateController.selectedRestaurant.value.restaurantId),
          builder:(context,snapshot){
            if(snapshot.connectionState== ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            } else {
              var lst = snapshot.data as List<CategoryModel>;

              return Container(margin: const EdgeInsets.only(top:10),
                child: CategoryListWidget(lst: lst, categoryStateController: categoryStateController),
              );
            }
          },));
  }

}