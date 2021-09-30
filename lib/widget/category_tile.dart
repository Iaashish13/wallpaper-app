import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_app/screens/category_screen.dart';


class CategoryTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryTile({Key? key, required this.name, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(categoryName: name.toLowerCase())));
      } ,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 80,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 25,
              left: 30,
              child: Text(
                name,
                style: GoogleFonts.oswald(
                 textStyle:const TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
               fontWeight: FontWeight.w500,
                 ),
                  
                ),
                // style: const TextStyle(
                //   color: Colors.white,
                //   fontSize: 20.0,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
