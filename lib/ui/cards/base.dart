import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Key key;
  final EdgeInsetsGeometry padding;
  final DateTime compare;
  final Color color;
  final bool gradient;

  BaseCard(
      {this.child,
      this.key,
      this.padding,
      this.compare,
      this.color,
      this.gradient = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 6.0, right: 6.0),
      decoration: BoxDecoration(
        color: color,
        gradient: gradient
            ? LinearGradient(
                colors: [color, TinyColor(color).spin(20).darken(10).color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
