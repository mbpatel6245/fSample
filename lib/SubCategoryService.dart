import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navigation_drawer/model/SubCategoryList.dart';

Future<SubCategoryList> fetchSubCategory(var product_id) async {
  final response =
  await http.get('http://ugoldi.in/api/subcategory.php?c_id='+product_id);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return SubCategoryList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Sub Category List');
  }
}