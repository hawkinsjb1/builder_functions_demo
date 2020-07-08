import 'package:flutter/material.dart';

typedef ScreenSizeWidgetBuilder = Widget Function(
    BuildContext context, BoxConstraints constraints, ScreenSize size);

enum ScreenSize { small, normal }

class ScreenSizeBuilder extends StatelessWidget {
  final ScreenSizeWidgetBuilder builder;
  ScreenSizeBuilder({this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight < 600)
          return builder(context, constraints, ScreenSize.small);
        return builder(context, constraints, ScreenSize.normal);
      },
    );
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     var aspectRatio = constraints.maxHeight / constraints.maxWidth;
    //     if (aspectRatio < 1.7)
    //       return builder(context, constraints, ScreenSize.small);
    //     return builder(context, constraints, ScreenSize.normal);
    //   },
    // );
  }
}
