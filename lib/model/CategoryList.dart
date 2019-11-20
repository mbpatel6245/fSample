class CategoryList {
  final List<CategoryModel> categories;
  final int status;

  CategoryList({
    this.status,
    this.categories,
  });

  factory CategoryList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['category'] as List;
    print(list.runtimeType);

    List<CategoryModel> catList =
        list.map((i) => CategoryModel.fromJson(i)).toList();

    return CategoryList(status: parsedJson['status'], categories: catList);
  }
}

class CategoryModel {
  final String id;
  final String name;

  CategoryModel({
    this.id,
    this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
