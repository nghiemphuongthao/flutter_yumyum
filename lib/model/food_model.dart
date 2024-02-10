import 'package:flutter_yumyum/model/size_model.dart';
import 'addon_model.dart';

class FoodModel {
  String description='', id='', name='', image='';
  double price=0;
  List<SizeModel> size = new List<SizeModel>.empty(growable: true);
  List<AddonModel> addon = new List<AddonModel>.empty(growable: true);

  FoodModel(
      {required this.description,
        required this.id,
        required this.name,
        required this.image,
        required this.price,
        required this.size,
        required this.addon});

  FoodModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    id = json['id'];
    image = json['image'];
    if(json['addon']!=null){
      addon = List<AddonModel>.empty(growable: true);
      json['addon'].forEach((v){
        addon.add(AddonModel.fromJson(v));
      });
    }
    if(json['size']!=null){
      size = List<SizeModel>.empty(growable: true);
      json['size'].forEach((v){
        size.add(SizeModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final data = Map<String,dynamic>();
    data['description']=this.description;
    data['id']=this.id;
    data['name']=this.name;
    data['image']=this.image;
    data['price']=this.price;
    data['size']=this.size.map((v) => v.toJson()).toList();
    data['addon']=this.addon.map((v) => v.toJson()).toList();
    return data;
  }
}