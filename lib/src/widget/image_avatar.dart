import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageAvatarType { ON, OFF }

class ImageAvatar extends StatelessWidget {
  final String path;
  final double size;
  final ImageAvatarType type;
  const ImageAvatar(
      {super.key, required this.path, required this.size, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: (type == ImageAvatarType.ON) ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(100)),
      child: Container(
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: path,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
