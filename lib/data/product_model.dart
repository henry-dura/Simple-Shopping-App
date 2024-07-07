class ProductModel {
  final List<Item> items;

  ProductModel({
    required this.items,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(

      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }

}

class Item {
  final String? id;
  final String? name;
  final List<Photo> photos;
  final List<CurrentPrice> currentPrice;

  Item({
    required this.id,
    required this.name,
    required this.photos,
    required this.currentPrice,

  });

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      name: json["name"],
      photos: json["photos"] == null ? [] : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      currentPrice: json["current_price"] == null ? [] : List<CurrentPrice>.from(json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),

    );
  }

}

class CurrentPrice {

  final List<dynamic> ngn;
  CurrentPrice({
    required this.ngn,
  });

  factory CurrentPrice.fromJson(Map<String, dynamic> json){
    return CurrentPrice(
      ngn: json["NGN"] == null ? [] : List<dynamic>.from(json["NGN"]!.map((x) => x)),
    );
  }

}

class Photo {
  final String? url;

  Photo({
    required this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
      url: json["url"],
    );
  }

}
