import 'package:filcnaplo/data/context/app.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

// ignore: non_constant_identifier_names
SlidingSheetDialog CustomBottomSheet({
  Widget child,
  EdgeInsetsGeometry padding,
}) {
  return SlidingSheetDialog(
    elevation: 8,
    cornerRadius: 16,
    duration: Duration(milliseconds: 300),
    snapSpec: const SnapSpec(
      snap: true,
      snappings: [0.4, 0.7, 1.0],
      positioning: SnapPositioning.relativeToAvailableSpace,
    ),
    cornerRadiusOnFullscreen: 0,
    color: app.settings.theme.backgroundColor,
    builder: (context, state) {
      return SheetListenerBuilder(
        buildWhen: (oldState, newState) => oldState.isAtTop != newState.isAtTop,
        builder: (context, state) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 100),
            padding: padding ?? EdgeInsets.only(top: 12.0),
            child: SafeArea(
              child: Material(child: child),
            ),
          );
        },
      );
    },
  );
}
