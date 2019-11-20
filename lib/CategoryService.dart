import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:navigation_drawer/model/CategoryList.dart';

Future<CategoryList> fetchCategory() async {
  final response =
  await http.get('http://ugoldi.in/api/category.php');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return CategoryList.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load CategoryList');
  }
}