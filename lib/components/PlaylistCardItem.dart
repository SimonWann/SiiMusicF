import 'package:flutter/material.dart';

class PlaylistCardItem extends StatefulWidget {
  late String title;
  late String imageUrl;
  late String introduce;
  PlaylistCardItem(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.introduce});

  @override
  _PlaylistCardItem createState() => _PlaylistCardItem();
}

class _PlaylistCardItem extends State<PlaylistCardItem>
    with TickerProviderStateMixin {
  var active = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    animation = Tween(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        onTapDown: (TapDownDetails e) {
          setState(() {
            controller.forward();
          });
        },
        onTapUp: (TapUpDetails e) {
          controller.reverse();
        },
        onHover: (bool a) {
          setState(() {
            active = a;
          });
        },
        child: Container(
            width: 176,
            height: 270,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                    top: 0,
                    child: Transform.scale(
                      scale: animation.value,
                      child: AnimatedContainer(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 12),
                        decoration: BoxDecoration(
                            color:
                                active ? Color(0xff242424) : Color(0xff141414),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        height: 270,
                        width: 176,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.fastOutSlowIn,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(widget.imageUrl,
                                      width: 154,
                                      height: 144,
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.title,
                                  style: const TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Container(
                              height: 8,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(widget.introduce,
                                  style: const TextStyle(
                                      color: Color(0xffa2a2a2), fontSize: 14)),
                            )
                          ],
                        ),
                      ),
                    )),
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    bottom: active ? 124 : 114,
                    right: 20,
                    curve: Curves.fastOutSlowIn,
                    child: AnimatedOpacity(
                        opacity: active ? 1 : 0,
                        duration: Duration(milliseconds: 250),
                        curve: Curves.fastOutSlowIn,
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xff1FDF64),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff494949),
                                    offset: Offset(0, 3),
                                    blurRadius: 3,
                                    spreadRadius: 1)
                              ]),
                          child: const Icon(Icons.play_arrow,
                              size: 30, color: Color(0xff101010)),
                        )))
              ],
            )));
  }
}
