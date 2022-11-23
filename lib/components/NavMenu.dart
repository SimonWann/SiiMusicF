import 'package:flutter/material.dart';
import 'package:sii_music/components/NavItem.dart';

class NavMenu extends StatefulWidget{
  NavMenu({Key? key});

  @override
  _NavMenuState createState() {
    // TODO: implement createState
    return _NavMenuState();
  }
}
class _NavMenuState extends State<NavMenu>{
  var menuItems = [
    {
      "label": "首页",
      "key": const Key("home"),
      "icon": Icons.home,
      "active": false,
      "onTap": (Key? key) {
        if(key != null) {
          print(key);
        }
      }
    },
    {
      "label": "搜索",
      "key": const Key("search"),
      "active": false
    },
    {
      "label": "库",
      "key": const Key("library"),
      "icon": Icons.class_,
      "active": false
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // _NavMenuState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: EdgeInsets.fromLTRB(4, 20, 10, 5),
      color: Color(0xff000000),
      child: Column(
        children: menuItems.map<Widget>((val) => NavItem.Map(m: val)).toList()
      ),
    );
  }
}
