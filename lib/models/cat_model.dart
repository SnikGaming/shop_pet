class CatModel {
  String name, age, price, information, image;
  int color, id;
  CatType type;

  CatModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.age,
      required this.price,
      required this.color,
      required this.information,
      required this.type});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'price': price,
        'color': color,
        'information': information,
        'type': type,
        'image': image
      };

  static CatModel fromJson(Map<String, dynamic> json) => CatModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      price: json['price'],
      color: json['color'],
      information: json['information'],
      image: json['image'],
      type: json['type']);
}

class CatType {
  String Name;
  CatType({
    required this.Name,
  });

  static List<CatType> type = [
    CatType(Name: "Mèo tây"),
    CatType(Name: "Mèo ta")
  ];
}
