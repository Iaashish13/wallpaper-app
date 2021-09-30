import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/networking.dart';
import 'package:wallpaper_app/models/photos_model.dart';
import 'package:wallpaper_app/widget/used_widgets.dart';
import 'package:wallpaper_app/widget/wallpaper_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: appBarTitle(),
        backgroundColor: Colors.white24,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Icon((Icons.save)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FutureBuilder<PhotoModel?>(
                    future: Services().getSearchedPhotos(widget.categoryName),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.photos!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return WallpaperTile(
                                  imageUrl: snapshot
                                      .data!.photos![index].src!.portrait!);
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
