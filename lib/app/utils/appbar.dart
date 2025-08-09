import 'package:flutter/material.dart';

AppBar appBarConst(String text) {
  return AppBar(
    leading: const BackButton(),
    title: Text(text),
    // centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
  );
}
