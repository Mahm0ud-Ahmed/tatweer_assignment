import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/config/assets/assets.gen.dart';

class ImageWidget extends StatelessWidget {
  final dynamic image;
  final BoxFit fit;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Color? svgColor;

  const ImageWidget({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      margin: margin,
      decoration: decoration,
      child: buildImage(context));
  }

  Widget? buildImage(BuildContext context) {
    switch (image.runtimeType) {
      case SvgGenImage:
        return _buildSvgAsset(image);
      case AssetGenImage:
        return _buildImageAsset(image);
      case String:
        return _buildImageNetwork(image);
      default:
        return null;
    }
  }

  SvgPicture _buildSvgAsset(SvgGenImage asset) {
    return asset.svg(
      fit: fit,
      width: width,
      height: height,
      //alignment: alignment,
    );
  }

  Image _buildImageAsset(AssetGenImage asset) {
    return asset.image(
      fit: fit,
      width: width,
      height: height,
    );
  }

  dynamic _buildImageNetwork(String url) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: url,
      width: width,
      height: height,
      placeholder: (context, url) => Assets.images.appLogo.svg(
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
      errorWidget: (context, url, error) => Assets.images.appLogo.svg(
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
