import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/core/resources/app_assets.dart';

import '../../../../core/app_const/app_const.dart';

class MovieImage extends StatelessWidget {
  final String imageUrl;
  final double width, height;
  const MovieImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppConstant.imageUrl(imageUrl),
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
          height: height,
          child: const Center(child: CircularProgressIndicator())),
      errorWidget: (context, url, error) => Container(
        height: height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(AppAssets.noImageFound),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
