import 'package:flutter_yumyum/firebase/best_deals_reference.dart';
import 'package:flutter_yumyum/firebase/popular_reference.dart';
import 'package:flutter_yumyum/model/popular_item_model.dart';
import 'package:flutter_yumyum/view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';

class RestaurantHomeDetailViewModelImp implements RestaurantHomeDetailViewModel{
  @override
  Future<List<PopularItemModel>> displayMostPopularItemByRestaurantId(String restaurantId) {
    return getMostPopularItemByRestaurantId(restaurantId);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId) {
    return getBestDealByRestaurantId(restaurantId);
  }
}