import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  void editData() {
    var url = "http://10.0.2.2/dakhil/editData.php";
    http.post(url, body: {
      //the words in the double quotes needs to be the same as the ones in php file with the $_POST var
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    controllerCode =
        TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          //use ListView here to overcome the space issue
          children: [
            Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                  controller: controllerCode,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                  ),
                  controller: controllerName,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Item Price",
                    labelText: "Item Price",
                  ),
                  controller: controllerPrice,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                  ),
                  controller: controllerStock,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  onPressed: () {
                    editData();
                    Navigator.pop(context);
                  },
                  color: Colors.blueAccent,
                  child: Text("Edit data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
