import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'kien/cart_Reader.dart';

class CartsLocal {
  static List<Carts> localCart = [];

  static Future<void> loadDataLocal() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? localCartString = prefs.getString('localCart');
      if (localCartString != null) {
        List<dynamic> decodedList = json.decode(localCartString);
        localCart = decodedList.map((item) => Carts.fromJson(item)).toList();
      }
    } catch (e) {
      print('Error loading local data: $e');
    }
  }

  static Future<void> addNewCartLocal(Carts newCart) async {
    try {
      localCart.add(newCart);
      saveDataLocal();
    } catch (e) {
      print('Error saving local data: $e');
    }
  }

  static Future<void> deleteCartLocal(String autoid) async {
    try {
      localCart.removeWhere((cart) => cart.id == autoid);
      saveDataLocal();
    } catch (e) {
      print('Error deleting local cart: $e');
    }
  }

  static Future<void> saveDataLocal() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String localCartString = json.encode(localCart);
      prefs.setString('localCart', localCartString);
    } catch (e) {
      print('Error saving local data: $e');
    }
  }
}
