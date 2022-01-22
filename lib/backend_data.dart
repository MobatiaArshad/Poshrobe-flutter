import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



Future<int> login(String email, String password) async {
  final http.Response response = await http.post(
    Uri.parse('https://poshrobe.com/user/mobile_login/$email/$password'),
  );
  if (response.statusCode == 200) {
    print(response.body);
    //TODO Save user
  }


  return response.statusCode;

}