import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/home.dart';
import 'package:flutter_application_2/pages/pre_screen.dart';

void main() => runApp(MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Colors.deepOrangeAccent)),
        initialRoute: '/',
        routes: {
          '/': (context) => MainScreen(),
          '/todo': (context) => const Home(),
        }));
