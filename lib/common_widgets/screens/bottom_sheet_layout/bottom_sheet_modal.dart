import 'package:flutter/material.dart';

Future<void> bottomSheet({required BuildContext context, height, required List<Widget> children}) async {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: height ?? 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: children
            ),
          ),
        );
      });
}