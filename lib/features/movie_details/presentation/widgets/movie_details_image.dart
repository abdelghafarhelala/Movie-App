import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_const/app_const.dart';

class MovieDetailsImageWidget extends StatelessWidget {
  final String? image;
  const MovieDetailsImageWidget({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0.0, 0.5, 1.0, 1.0],
        ).createShader(
          Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        width: MediaQuery.of(context).size.width,
        imageUrl: AppConstant.imageUrl(image),
        fit: BoxFit.fill,
      ),
    );
  }
}
