import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() {
    // TODO: implement createState
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff101010),
      child: Text('home'),
    );
  }
}