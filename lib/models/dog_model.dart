class DogModel {
  String name, age, price, information, image;
  int color, id;
  DogType type;

  DogModel(
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

  static DogModel fromJson(Map<String, dynamic> json) => DogModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      price: json['price'],
      color: json['color'],
      information: json['information'],
      image: json['image'],
      type: json['type']);
}

class DogType {
  String Name;
  DogType({
    required this.Name,
  });

  static List<DogType> type = [
    DogType(Name: "Chó cảnh"),
    DogType(Name: "Chó săn")
  ];
}
