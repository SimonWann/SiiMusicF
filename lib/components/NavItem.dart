import 'package:flutter/material.dart';

class NavItem extends StatefulWidget{
  String label;
  bool active;
  IconData icon;
  Function? onTap;
  NavItem({Key? key, this.label = '', this.active = false, this.icon = Icons.search});
  NavItem.Map({Map m = const {}}): label = m['label'] ?? '未知', active = m['active'], icon = m['icon'] ?? Icons.search, onTap = m['onTap'];

  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> with SingleTickerProviderStateMixin{
  int gray = 0xffb2b2b2;
  int white = 0xffffffff;
  Color _fontColor = Color(0xffb2b2b2);
  Color _iconColor = Color(0xffb2b2b2);
  Color _bg = const Color(0xffffffff);
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    animation = Tween(begin: 1.0, end: 0.95).animate(controller)
      ..addListener(() {
        setState(() => {});
      });
    print(animation.value);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
          onTapDown: (e) {
            controller.forward();
          },
          onTapUp: (e) {
            controller.reverse();
          },
          onTap: () {
            if(widget.onTap != null) {
              widget.onTap!(widget.label);
            }
          },
          onHover: (bool v) {
            if(v) {
              setState(() {
                _fontColor = Color(white);
              });
            } else if(!widget.active){
              setState(() {
                _fontColor = Color(gray);
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 16
                ),
                child: Transform.scale(
                  scale: animation.value,
                  origin: const Offset(0, 0),
                  child: Row(
                    children: [
                      Icon(
                        widget.icon,
                        color: widget.active ? Color(white) :Color(gray),
                        size: 28.0,
                      ),
                      Container(
                        width: 12.0,
                      ),
                      Text(widget.label,
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: widget.active ? Color(white) : _fontColor
                          )
                      ),
                    ],
                  ),
                )
            )
          )
      );
  }
}
