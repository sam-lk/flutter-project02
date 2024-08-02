import 'package:flutter/material.dart';
import 'package:project02/models/user.dart';
import 'package:project02/views/login.dart';
import 'package:project02/views/shops.dart';
import 'package:project02/views/users.dart';
import 'package:project02/views/vehicles.dart';

void main() {
  runApp(const MyApp());
}

//#### loku change ekak karoth project eke settings wala. prject eka cash clear krnna one. ####
//#### termnial eke 'flutter clean' then 'flutter pub get' ####

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class PlaceholderWidgetSam extends StatelessWidget {
  final Color color;
  final String textItem;

  PlaceholderWidgetSam(this.color, this.textItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 200,
      width: 200,
      child: Text(textItem),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int _currentIndex = 0;
  final List _children = [
    ShopView(),
    Vehicles(),
    LoginView(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //--------
    return Scaffold(
      //----Top App bar-----
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //----Body view-----
      body: //LoginView()
          _children[_currentIndex],
      //----Bottem navigation bar-----
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Shops',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            label: 'Vehicles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
