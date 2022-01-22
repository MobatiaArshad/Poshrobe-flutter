import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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