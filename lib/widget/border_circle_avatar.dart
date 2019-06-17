import 'package:flutter/material.dart';

class BorderShapeContainer extends StatelessWidget {
  final Widget widget;
  final double width, height;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxBorder border;
  final AlignmentGeometry alignment;
  final BoxShape boxShape;

  BorderShapeContainer(this.widget,
      {
      this.margin,
      this.padding,
      this.alignment,
      this.border,
      this.backgroundColor,
      this.width,
      this.height,
      BoxShape boxShape})
      : this.boxShape = boxShape ?? BoxShape.circle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(border: border, shape: boxShape,color: backgroundColor,),
      margin: margin,
      child: widget,
    );
  }
}


