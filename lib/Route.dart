import 'package:flutter/material.dart';
import 'package:sii_music/Page/MyLibrary.dart';
import 'package:sii_music/Page/Playlist.dart';
import 'package:sii_music/Page/Profile.dart';
import 'package:sii_music/Page/RightContainer.dart';
import 'package:sii_music/Page/Search.dart';
import 'package:sii_music/Page/Home.dart';
import 'package:sii_music/components/NavMenu.dart';
import 'package:sii_music/Routes/main.dart';

class SiiRoute extends StatefulWidget{
  const SiiRoute({Key? key});

  @override
  _SiiRouteState createState() => _SiiRouteState();
}

class _SiiRouteState extends State<SiiRoute> with SingleTickerProviderStateMixin {
  var routeStack = <Widget>[];
  late BuildContext pageContext;
  var routes = Routes.routes;
  final _stackSize = 100;
  late AnimationController controller;
  late Animation<double> animation;
  pop() {
    routeStack.removeLast();
    controller.reverse();
  }
  push(Widget child) {
    // routeStack.add(pageContext.widget);
    if(routeStack.length > _stackSize) {
      routeStack.removeAt(0);
    }
    routeStack.add(child);
    controller.forward(
      from: 0.8
    );
  }
  of({BuildContext? context}) {
    if(context != null) {
      pageContext = context;
    }
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600)
    );
    animation = Tween(begin: 0.8 ,end: 0.0).animate(controller)
    ..addListener(() {
      setState(() => {});
    })
    ;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        NavMenu(
          onRouteChange: (String url) {
            setState(() {
              var temp = routes[url];
              if(temp != null) {
                push(temp());
              }
            });

          },
        ),
        Expanded(
          flex: 1,
          child:  Container(

            decoration: const BoxDecoration(
              color: Color(0xff212121),

            ),
            height: MediaQuery.of(context).size.width,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              reverseDuration: Duration(milliseconds: 100),
              transitionBuilder: (child, animation) {
                var tween = Tween<Offset>(begin: Offset(0.1, 0), end: Offset(0, 0));
                return FadeTransition(opacity: animation, child: SlideTransition(position: tween.animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastOutSlowIn
                )) , child: child),) ;
              },
              child: routeStack.isNotEmpty ? routeStack[routeStack.length - 1] : Container(),
            )

            // Transform.translate(
            //   offset: Offset(animation.value * 100, animation.value * 400),
            //   child: routeStack.isNotEmpty ? routeStack[routeStack.length - 1] : Container(),
            // )
          )
        )

      ],
    );
  }
}