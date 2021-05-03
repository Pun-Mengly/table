import 'dart:math';

import 'package:flutter/material.dart';

class DataTables extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DataTables> {
  // Generate a list of products
  List<Map> _products = List.generate(50, (i) {
    return {"id": i, "name": "Product $i", "price": Random().nextInt(500) + 1};
  });

  int _currentSortColumn = 0;
  bool _isAscending = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF262AAA),
                    ),
                    labelText: 'Search by  ID',
                    fillColor: Colors.blueAccent,
                  ),
                  onChanged: (string) {
                    setState(() {});
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: DataTable(
                    dividerThickness: 2.0,
                    showBottomBorder: false,
                    headingRowColor:
                        MaterialStateProperty.all(Color(0xFF262AAA)),
                    sortColumnIndex: _currentSortColumn,
                    sortAscending: _isAscending,
                    columns: [
                      DataColumn(
                          label: Text(
                            'Id',
                            style: TextStyle(color: Colors.white),
                          ),
                          onSort: (columnIndex, _) {
                            setState(() {
                              _currentSortColumn = columnIndex;
                              if (_isAscending == true) {
                                _isAscending = false;
                                // sort the product list in Ascending, order by id
                                _products.sort((productA, productB) =>
                                    productB['id'].compareTo(productA['id']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by id
                                _products.sort((productA, productB) =>
                                    productA['id'].compareTo(productB['id']));
                              }
                            });
                          }),
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DataColumn(
                          label: Text(
                            'Price',
                            style: TextStyle(color: Colors.white),
                          ),
                          // Sorting function
                          onSort: (columnIndex, _) {
                            setState(() {
                              _currentSortColumn = columnIndex;
                              if (_isAscending == true) {
                                _isAscending = false;
                                // sort the product list in Ascending, order by Price
                                _products.sort((productA, productB) =>
                                    productB['price']
                                        .compareTo(productA['price']));
                              } else {
                                _isAscending = true;
                                // sort the product list in Descending, order by Price
                                _products.sort((productA, productB) =>
                                    productA['price']
                                        .compareTo(productB['price']));
                              }
                            });
                          }),
                      DataColumn(
                        label: Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    rows: _products.map((item) {
                      return DataRow(cells: [
                        DataCell(Text(item['id'].toString())),
                        DataCell(Text(item['name']), onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Update()),
                          // );
                          print('Product ${item}');
                        }),
                        DataCell(Text(item['price'].toString())),
                        DataCell(IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              int index = _products.indexOf(item);
                              _delete(index);
                            });
                            print('deleted');
                          },
                        ))
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('add');
          },
        ),
      ),
    );
  }

  _delete(int id) async {
    final respone = await _products.removeAt(id);
    return true;
  }
}
