import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: prefer_const_constructors
void main() => runApp(MaterialApp(
      home: const UserPanel(),
    ));

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: const Text('Check time'),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(padding: EdgeInsets.only(top: 30)),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/1.png'),
                  radius: 70,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Text(
                  'Danila Korneenko',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.mail_outline, size: 25),
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    const Text(
                      'd.korneenko@innopolis.university',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Движ: $_count',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessible_forward),
        backgroundColor: Colors.amber,
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}
