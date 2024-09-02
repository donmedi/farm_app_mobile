import 'package:flutter/material.dart';

Future customBottomSheet(context, Widget view) {
  return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      elevation: 1,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (_) {
        return view;
      });
}
