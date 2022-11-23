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

class _NavItemState extends State<NavItem>{
  int gray = 0xffd2d2d2;
  int white = 0xffffffff;
  Color _fontColor = Color(0xffd2d2d2);
  Color _iconColor = Color(0xffd2d2d2);
  Color _bg = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
          onTap: () {

            if(widget.onTap != null) {
              print('Hello');
              widget.onTap!(widget.key);
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
                    vertical: 10,
                    horizontal: 16
                ),
                child: Row(
                  children: [
                    Icon(
                        widget.icon,
                        color: _iconColor,
                        size: 30.0,
                    ),
                    Container(
                      width: 12.0,
                    ),
                    Text(widget.label,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                        color: _fontColor
                      )
                    ),
                  ],
                )
            )
          )
      );
  }
}
