import 'package:flutter/material.dart';
import 'package:flutter_belajar_api/home_page.dart';
import 'Model/item_model.dart';

class DetailPage extends StatelessWidget {

  final ItemModel user;

  DetailPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.orange,
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(user.urlAvatar),


            Text(user.username,
            style: TextStyle(
              fontSize: 30
            ),
            )
          ],
        ),
      ),
    );
  }
}
