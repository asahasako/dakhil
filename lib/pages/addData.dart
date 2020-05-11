import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerStock = TextEditingController();

  void addData() {
    var url = "http://10.0.2.2/dakhil/addData.php";

    http.post(url, body: {
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
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
                    addData();
                    Navigator.pop(context);
                  },
                  color: Colors.blueAccent,
                  child: Text("Add data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
