class ProductListTopCategoryModel {
  final List<ProductTopCategoryModel> product;
  final int status;

  ProductListTopCategoryModel({
    this.status,
    this.product,
  });

  factory ProductListTopCategoryModel.fromJson(
      Map<String, dynamic> parsedJson) {
    var list = parsedJson['product'] as List;
    print(list.runtimeType);

    List<ProductTopCategoryModel> product =
        list.map((i) => ProductTopCategoryModel.fromJson(i)).toList();

    return ProductListTopCategoryModel(status: parsedJson['status'], product: product);
  }
}

class ProductTopCategoryModel {
  String ProdcutID;
  String CategoryID;
  String SubCategoryId;
  String ProductName;
  String Description;
  String Price;
  String Discount;
  String Image;
  String Status;

  ProductTopCategoryModel(
      {this.ProdcutID,
      this.CategoryID,
      this.SubCategoryId,
      this.ProductName,
      this.Description,
      this.Price,
      this.Discount,
      this.Image,
      this.Status});

  factory ProductTopCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductTopCategoryModel(
      ProdcutID: json['ProdcutID'],
      CategoryID: json['CategoryID'],
      SubCategoryId: json['SubCategoryId'],
      ProductName: json['ProductName'],
      Description: json['Description'],
      Price: json['Price'],
      Discount: json['Discount'],
      Image: json['Image'],
      Status: json['Status'],
    );
  }
}
