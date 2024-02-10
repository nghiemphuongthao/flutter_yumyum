import 'package:flutter_yumyum/model/popular_item_model.dart';

abstract class RestaurantHomeDetailViewModel{
  Future<List<PopularItemModel>> displayMostPopularItemByRestaurantId(String restaurantId);
  Future<List<PopularItemModel>> displayBestDealsByRestaurantId(String restaurantId);
}