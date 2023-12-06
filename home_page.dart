import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_belajar_api/Helper/database_helper.dart';
import 'package:flutter_belajar_api/detail_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: FutureBuilder(
          future: getApi(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: const Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data[index].urlAvatar
                      ),
                    ),
                    title: Text(snapshot.data[index].username),
                    onTap: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}