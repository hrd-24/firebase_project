import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starting_slicing/app/constants/export.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.gray300,
      highlightColor: Colors.grey[300]!,
      child: child,
    );
  }
}
