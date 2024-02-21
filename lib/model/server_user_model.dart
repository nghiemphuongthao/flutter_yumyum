class ServerUserModel {
  String name='', restaurant='', uid='', phone='';
  bool _isAtive= false;
  bool get isActive => _isAtive;

  ServerUserModel(
      this.name, this.restaurant, this.uid, this.phone);

  ServerUserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    restaurant = json['restaurant'];
    uid = json['uid'];
    phone = json['phone'];
    _isAtive = json['isActive'] as bool;
  }

  Map<String, dynamic> toJson(){
    var data=Map<String, dynamic>();
    data['name']=this.name;
    data['restaurant']=this.restaurant;
    data['uid']=this.uid;
    data['phone']=this.phone;
    data['isActive']=this._isAtive;
    return data;
  }
}