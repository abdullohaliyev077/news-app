import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingContainer extends StatelessWidget {
  final double width;
  final double hight;
  const LoadingContainer({super.key, required this.width, required this.hight});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.background,
        highlightColor: Theme.of(context).colorScheme.primaryContainer,
        child: Container(
          width: width,
          height: hight,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
