import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navigation_drawer/model/ProductListTopCategoryModel.dart';

Future<List> fetchProductList(var subCatId) async {
  print('http://ugoldi.in/api/product.php?s_id=' + subCatId);
  final response =
      await http.get('http://ugoldi.in/api/product.php?s_id=' + subCatId);
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    ProductListTopCategoryModel model =
        ProductListTopCategoryModel.fromJson(json.decode(response.body));
    return (model.status>0)?model.product:new List();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load ProductList');
  }
}
