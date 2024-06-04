import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/global.colors.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: GlobalColors.garis,
        highlightColor: Colors.white,
        child: const Text('Shimmer'),
      ),
    );
  }
}
