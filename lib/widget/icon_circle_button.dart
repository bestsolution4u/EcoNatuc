import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconCircleButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onClick;
  final double size, padding;

  IconCircleButton({this.icon, this.onClick, this.size = 16, this.padding = 8});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClick,
        highlightColor: Colors.grey[500],
        splashColor: Colors.grey[800],
        borderRadius: BorderRadius.circular(this.size),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: icon,
        ),
      ),
    );
  }
}
