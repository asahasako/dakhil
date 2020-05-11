import 'package:dakhil/tabs/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  List list;
  int index;
  Details({this.index, this.list});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void deleteData() {
    var url = "http://10.0.2.2/dakhil/deleteData.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alert = AlertDialog(
      content: Text(
          "Are you sure you want to delete '${widget.list[widget.index]['res_name']}'"),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            deleteData();
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => Restaurant()),
            );
          },
          child: Text("Confirm Delete"),
          color: Colors.red,
        ),
        RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel Delete"),
          color: Colors.green,
        ),
      ],
    );

    showDialog(
      context: context,
      child: alert,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['res_name']}"),
      ),
      body: Container(
        height: 250.0,
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['res_name'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  "Type of Cuisine: ${widget.list[widget.index]['res_cuisine']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Floor: ${widget.list[widget.index]['res_level']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Text(
                  "Shop Number: ${widget.list[widget.index]['res_shopnumber']}",
                  style: TextStyle(fontSize: 18.0),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        ),
                      ),
                      child: Text("Edit"),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: () => confirm(),
                      child: Text("Delete"),
                      color: Colors.red,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
