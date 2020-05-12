import 'package:dakhil/tabs/restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  final List list;
  final int index;

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Hero(
                            tag: widget.list[widget.index],
                            child: widget.list[widget.index]['res_image'] == ''
                                ? Flexible(
                                    child: Image.asset(
                                      "assets/images/logo.jpeg",
                                      height: 120.0,
                                      width: 150.0,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                : Flexible(
                                    child: Image.network(
                                      "http://10.0.2.2/dakhil/images/" +
                                          widget.list[widget.index]
                                              ['res_image'],
                                      height: 120.0,
                                      width: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            widget.list[widget.index]['res_name'],
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Address: Level ${widget.list[widget.index]['res_level']}, ${widget.list[widget.index]['res_shopnumber']}",
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    widget.list[widget.index]['res_phone'] == ''
                        ? Text(
                            "Phone number is not available for this shop",
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.red[400]),
                          )
                        : Text(
                            "Phone number: ${widget.list[widget.index]['res_phone']}",
                            style: TextStyle(fontSize: 18.0),
                          ),
                    Text(
                      "Type of cuisine: ${widget.list[widget.index]['res_cuisine']}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Description: ${widget.list[widget.index]['res_details']}",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
