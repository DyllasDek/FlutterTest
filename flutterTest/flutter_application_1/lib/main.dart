import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(primaryColor: Colors.redAccent),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Test'),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.red,
            child: Image(image: AssetImage('assets/1.png')),
            //margin: EdgeInsets.all(20.5),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            padding: EdgeInsets.all(10),
          ),
          //Center(
          //child: Image(image: AssetImage('assets/1.png')),
          //   ),
          /*
          Center(
              child: ElevatedButton(
            onPressed: () {
              print('test');
            },
            child: Text('Test'),
          )*/
          /*
              FlatButton(
                  onPressed: () {
                    print('1');
                  },
                  child: Text('Press on me'),
                  color: Colors.amber)
              */
          // Icon(Icons.settings_applications, size: 45, color: Colors.blueGrey),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('Lox');
            },
            backgroundColor: Colors.redAccent,
            child: const Text(
              'lox',
              style: TextStyle(fontFamily: 'Frankc'),
            ),
          ),
        ),
      );
}
