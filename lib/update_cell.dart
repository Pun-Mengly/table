import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  // final String id;
  // final String name;
  // final String price;
  //
  // Update(this.id, this.name, this.price);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  readOnly: true,
                  initialValue: 'Id',
                ),
                TextFormField(
                  initialValue: 'Product Name',
                ),
                TextFormField(
                  initialValue: 'Price',
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      print('Updated');
                    },
                    child: Text('Update'.toUpperCase()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
