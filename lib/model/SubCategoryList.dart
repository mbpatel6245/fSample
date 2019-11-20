class SubCategoryList {
  final List<SubCategoryModel> subCategories;
  final int status;

  SubCategoryList({
    this.status,
    this.subCategories,
  });

  factory SubCategoryList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['Subcategory'] as List;
    print(list.runtimeType);

    List<SubCategoryModel> catList = [];
    if (list != null)
      catList = list.map((i) => SubCategoryModel.fromJson(i)).toList();

    return SubCategoryList(
        status: parsedJson['status'], subCategories: catList);
  }
}

class SubCategoryModel {
  final String subcategoryid;
  final String categoryid;
  final String subcategoryname;

  SubCategoryModel({this.subcategoryid, this.categoryid, this.subcategoryname});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      subcategoryid: json['SubCategoryID'],
      categoryid: json['CategoryID'],
      subcategoryname: json['SubCategoryName'],
    );
  }
}
