import 'dart:convert';
import 'package:dakhil/pages/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Restaurant extends StatefulWidget {
  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  //getting the php file
  Future<List> _getData() async {
    final response = await http.get("http://10.0.2.2/dakhil/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant"),
      ),
      body: FutureBuilder<List>(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

//ItemList widget : returns items from database
class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => new Details(
                list: list,
                index: i,
              ),
            )),
            child: Card(
              child: ListTile(
                title: Text(list[i]['res_name']),
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: 44, minWidth: 44, maxHeight: 64, maxWidth: 64),
                  child: Hero(
                    tag: list[i],
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                subtitle: Text("Level : ${list[i]['res_level']}"),
              ),
            ),
          ),
        );
      },
      itemCount: list == null ? 0 : list.length,
    );
  }
}
