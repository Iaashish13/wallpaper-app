import 'package:flutter/material.dart';

class WallpaperTile extends StatelessWidget {
  final String imageUrl;
  const WallpaperTile({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
