import 'package:flutter_yumyum/firebase/category_reference.dart';
import 'package:flutter_yumyum/model/category_model.dart';
import 'package:flutter_yumyum/view_model/category_vm/category_viewmodel.dart';

class CategoryViewModelImp implements CategoryViewModel{
  @override
  Future<List<CategoryModel>> displayCategoryByRestaurantId(String restaurantId) {
    return getCategoryByRestaurantId(restaurantId);
  }
}