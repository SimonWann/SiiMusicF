import 'package:flutter/material.dart';
import 'package:sii_music/components/PlaylistCardItem.dart';

class PlaylistContainer extends StatefulWidget{
  late String title;
  var albumList = <Map<String, String>>[];
  PlaylistContainer({Key? key, required this.title, required this.albumList});

  _PlaylistContainer createState() => _PlaylistContainer();
}
class _PlaylistContainer extends State<PlaylistContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        20,
        88,
        20,
        48
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
              Text(
                  "测试",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                  )
              )

          ),
          Container(
            height: 26,
          ),
          Container(
              width: double.infinity,
              height: 270,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 32,
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: widget.albumList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlaylistCardItem(
                    title: widget.albumList[index]['title'] ?? '未知',
                    imageUrl: widget.albumList[index]['imageUrl'] ?? '未知',
                    introduce: widget.albumList[index]['introduce'] ?? '未知',
                  );
                },
              )
          )

        ],
      ),
    );
  }
}