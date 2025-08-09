import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/export.dart';

Text titleInputWidget(String title) {
  return Text(title, style: AppTextStyle.bold(fontSize: AppFontSize.body));
}

Align titleFormWidget(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(title, style: AppTextStyle.bold(fontSize: AppFontSize.h4)),
  );
}
