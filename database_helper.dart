import 'dart:convert';
import 'package:flutter_belajar_api/Model/item_model.dart';
import 'package:http/http.dart' as http;


Future<List<ItemModel>> getApi() async {
  var data = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
  var jsonData = json.decode(data.body);

  List<ItemModel> users = [];

  for (var u in jsonData) {
    ItemModel itemModel = ItemModel(
      u["name"],
      u["image"],
    );

    users.add(itemModel);
  }
  print(users.length);

  return users;
}