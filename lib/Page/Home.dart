import 'package:flutter/material.dart';
import 'package:sii_music/components/PlaylistContainer.dart';

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
      child: Column(
        children: [
          PlaylistContainer(
            title: '',
            albumList: [
              {
                'title': '测试1',
                'imageUrl': 'https://cdn.mos.cms.futurecdn.net/P6s5Nut6ZApxMKHc6xxf73-415-80.jpg',
                'introduce':'测试'
              },
              {
                'title': '测试2',
                'imageUrl': 'https://cdn.mos.cms.futurecdn.net/P6s5Nut6ZApxMKHc6xxf73-415-80.jpg',
                'introduce':'测试2'
              },
            ],
          )
        ],
      ),
    );
  }
}