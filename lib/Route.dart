import 'package:flutter/material.dart';
import 'package:sii_music/components/NavMenu.dart';

class SiiRoute extends StatefulWidget{
  const SiiRoute({Key? key});

  @override
  _SiiRouteState createState() => _SiiRouteState();
}

class _SiiRouteState extends State<SiiRoute> {
  @override
  void initState() {

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        NavMenu()
      ],
    );
  }
}