import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gaming',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GAMING'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'game for touching'.toUpperCase(),
                  style: TextStyle(color: Colors.teal, fontSize: 20),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.redAccent,
                      fontSize: 27),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  child: Text('Admin'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataTables()),
                    );
                  },
                )
              ]),
        ),
        floatingActionButton: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _reset,
              child: Icon(Icons.refresh),
              backgroundColor: Colors.redAccent,
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          child: Container(
            height: 50,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
