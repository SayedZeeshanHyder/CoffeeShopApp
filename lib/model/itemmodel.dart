class ItemModel {
  ItemModel({
    required this.productname,
    required this.imageurl,
  });
  late final String productname;
  late final String imageurl;
  late final int quantity;

  ItemModel.fromJson(Map<String, dynamic> json){
    productname = json['productname'];
    imageurl = json['imageurl'];
    quantity=json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productname'] = productname;
    data['imageurl'] = imageurl;
    data['quantity']=quantity;
    return data;
  }
}