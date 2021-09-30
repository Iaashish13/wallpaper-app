import 'package:flutter/material.dart';
import 'package:wallpaper_app/screens/image_screen.dart';

class WallpaperTile extends StatelessWidget {
  final String imageUrl;
  const WallpaperTile({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen(imageUrl: imageUrl,)));
      },
      child: Hero(
        tag: imageUrl,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
