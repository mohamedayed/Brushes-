import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/resources.dart';

enum ImageType { svg, svgNetwork, png, network, file, unknown }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (isEmpty || startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetwork;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

class CustomImage extends StatelessWidget {
  final String image;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Color? color;
  final AlignmentGeometry? alignment;

  const CustomImage({
    required this.image,
    this.errorWidget,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius = AppSize.s0,
    this.color,
    this.alignment,
    super.key,
  });

  Widget _buildImageView() {
    switch (image.imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          image,
          height: height,
          width: width,
          fit: fit,
          alignment: alignment ?? AlignmentDirectional.center,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      case ImageType.svgNetwork:
        return SvgPicture.network(
          image,
          height: height,
          width: width,
          fit: fit,
          alignment: alignment ?? AlignmentDirectional.center,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
      case ImageType.file:
        return Image.file(
          File(image),
          height: height,
          width: width,
          fit: fit,
          alignment: alignment ?? AlignmentDirectional.center,
          color: color,
        );
      case ImageType.network:
        return FadeInImage.assetNetwork(
          image: image,
          width: width,
          height: height,
          alignment: alignment ?? AlignmentDirectional.center,
          placeholder: AppImages.placeholder,
          fit: fit,
          color: color,
          placeholderFit: BoxFit.cover,
          imageErrorBuilder: (_, __, ___) =>
              errorWidget ??
              Image.asset(
                AppImages.placeholder,
                fit: fit,
                width: width,
                alignment: alignment ?? AlignmentDirectional.center,
                height: height,
              ),
        );
      case ImageType.png:
      default:
        return Image.asset(
          image,
          height: height,
          width: width,
          fit: fit,
          alignment: alignment ?? AlignmentDirectional.center,
          color: color,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: _buildImageView(),
    );
  }
}
