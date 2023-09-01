import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 显示网络图片和本地 assets 中的资源图片
/// 本地图片：ImageView('test.png', width: xx, height: xx); 会自动拼接"assets/image/"
/// 网络图片：ImageView('http://xxxx.png', width: xx, height: xx);
/// 网络图片：ImageView('http://xxxx.png', size: xx);
class ImageView extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double? size;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;
  late final double? cornerRadius;
  final double? margin;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isCircle;
  final String placeholder;
  final Color? backgroundColor;
  final BoxFit? boxFit;
  final VoidCallback? onClick;
  final File? file;

  ImageView(
      this.url, {
        Key? key,
        this.width,
        this.height,
        this.size,
        this.marginBottom,
        this.marginRight,
        this.marginTop,
        this.marginLeft,
        this.margin,
        double? cornerRadius,
        this.isCircle,
        this.placeholder = 'assets/images/placeholder_default.png',
        this.borderColor,
        this.borderWidth,
        this.backgroundColor,
        this.onClick,
        this.boxFit,
        this.file,
      }) : super(key: key) {
    if (isCircle == true) {
      this.cornerRadius = (width ?? size) ?? 0 / 2;
    } else {
      this.cornerRadius = cornerRadius;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(marginLeft ?? 0, marginTop ?? 0, marginRight ?? 0, marginBottom ?? 0),
        decoration: BoxDecoration(
          border: Border.all(width: borderWidth ?? 0, color: borderColor ?? Colors.transparent),
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? 0)),
        ),
        child: onClick == null
            ? ClipRRect(borderRadius: BorderRadius.circular(cornerRadius ?? 0), child: getImage())
            : InkWell(
          onTap: onClick,
          child: ClipRRect(borderRadius: BorderRadius.circular(cornerRadius ?? 0), child: getImage()),
        ));
  }

  Widget getImage() {
    var place = placeholder.startsWith('assets/images') ? placeholder : 'assets/images/$placeholder';
    if (url.startsWith('http')) {
      //网络图片
      return CachedNetworkImage(
        imageUrl: url,
        width: width ?? size,
        height: height ?? size,
        fit: boxFit ?? BoxFit.cover,
        placeholder: (context, url) {
          return Image.asset(place, width: width ?? size, height: height ?? size, fit: boxFit ?? BoxFit.cover);
        },
      );
    } else if (url.startsWith('/private')) {
      return Image.asset(url, width: width ?? size, height: height ?? size, fit: boxFit ?? BoxFit.cover);
    } else if (url.isEmpty) {
      if (file != null) {
        return Image.file(file!, width: width ?? size, height: height ?? size, fit: boxFit ?? BoxFit.cover);
      } else {
        return Image.asset(place, width: width ?? size, height: height ?? size, fit: boxFit ?? BoxFit.cover);
      }
    } else {
      return Image.asset(url.startsWith('assets/images') ? url : 'assets/images/$url',
          width: width ?? size, height: height ?? size, fit: boxFit ?? BoxFit.cover);
    }
  }
}
