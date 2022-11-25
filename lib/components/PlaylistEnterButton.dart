import 'package:flutter/material.dart';

/**
 * @author[qq651]
 * @version[创建日期，2022/11/26 0:15]
 * @function[功能简介 ]
 **/
class PlaylistEnterButtonPage extends StatefulWidget {
  const PlaylistEnterButtonPage({Key? key}) : super(key: key);

  @override
  _PlaylistEnterButtonPageState createState() =>
      _PlaylistEnterButtonPageState();
}

class _PlaylistEnterButtonPageState extends State<PlaylistEnterButtonPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PlaylistEnterButton"),
        ),
        body: Center(
          child: Column(),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}