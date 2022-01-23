import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:poshrob/backend/backend_class.dart';
import 'package:poshrob/shared_pref.dart';



Future<int> login(String email, String password) async {
  final http.Response response = await http.post(
    Uri.parse('https://poshrobe.com/user/mobile_login/$email/$password'),
  );
  if (response.statusCode == 200) {
    HelperFunctions.saveUserLoggedIn(true);
    print(response.body);
    //TODO Save user
  }

  return response.statusCode;
}

Future<List<Header>> getHeaderCategories() async {
  final http.Response response = await http.get(
    Uri.parse('https://poshrobe.com/common/headercategories'),
  );
  var headers = <Header>[];
  if (response.statusCode == 200) {
    print(response.body);
    var headerJson = json.decode(response.body);
    headers= List<Header>.from(headerJson.map((model)=> Header.fromJson(model)));
  }
  return headers;
}