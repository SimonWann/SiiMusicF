import 'package:flutter/material.dart';
import 'package:sii_music/components/NavItem.dart';

class NavMenu extends StatefulWidget{
  Function onRouteChange;
  NavMenu({super.key, required this.onRouteChange});
  @override
  _NavMenuState createState() {
    // TODO: implement createState
    return _NavMenuState();
  }
}
class _NavMenuState extends State<NavMenu>{
  var currentActive = "";
  var menuItems = [];
  var myList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuItems = [
      {
        "label": "首页",
        "key": const Key("home"),
        "icon": Icons.home,
        "active": false,
        "onTap": setActive,
        "url": '/home'
      },
      {
        "label": "搜索",
        "key": const Key("search"),
        "active": false,
        "onTap": setActive,
        "url": "/search"
      },
      {
        "label": "库",
        "key": const Key("library"),
        "icon": Icons.class_,
        "active": false,
        "onTap": setActive,
        "url": "myLibrary"
      },
    ];
    myList = [
      {
        "label": "创建歌单",
        "key": const Key("createPlaylist"),
        "icon": Icons.add_circle_sharp,
        "active": false,
        "onTap": setActive,
        "url": "/playlist"
      },
      {
        "label": "喜欢的音乐",
        "key": const Key("liked"),
        "icon": Icons.favorite_sharp,
        "active": false,
        "onTap": setActive,
        "url": "/playlist"
      },
    ];
  }
  // _NavMenuState();
  void setActive(String? label) {
    if(label == null) {
      return;
    }
    setState(() {
      currentActive = label;
      var temp = [...menuItems, ...myList];
      temp = temp.map((val) {
        if(val["label"] == currentActive) {
          val["active"] = true;
        } else {
          val["active"] = false;
        }
        return val;
      }).toList();
      var result = temp.where((element) => element["label"] == currentActive);
      widget.onRouteChange(result.first['url']);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: EdgeInsets.fromLTRB(4, 20, 10, 5),
      color: Color(0xff000000),
      child: Column(
        children: [
          Column(
            children: menuItems.map<Widget>((val) => NavItem.Map(m: val)).toList()
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 0
            ),
          ),
          Column(
              children: myList.map<Widget>((val) => NavItem.Map(m: val)).toList()
          ),
          Container(
            height: 1,
            color: const Color(0xff323232),
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 18,
            ),
          )
        ]
      ),
    );
  }
}
