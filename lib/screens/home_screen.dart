import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/category_data.dart';
import 'package:wallpaper_app/helper/networking.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photos_model.dart';
import 'package:wallpaper_app/widget/categor_tile.dart';
import 'package:wallpaper_app/widget/app_bar.dart';
import 'package:wallpaper_app/widget/wallpaper_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> _categories = List<CategoryModel>.empty(growable: true);
// PhotoModel? _photos;
  // final Services _services = Services();
  @override
  void initState() {
    super.initState();
    _categories = getCategories();
    // _services.getPhotos().then((photos) {
    //   setState(() {
    //     _photos = photos;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: const Color(0xfff5f8fd),
                ),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                height: 80.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                    itemCount: _categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                          name: _categories[index].categoryName,
                          url: _categories[index].imageUrl);
                    }),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FutureBuilder<PhotoModel?>(
                  future: Services().getPhotos(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.photos!.length,
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
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
            ],
          ),
        ),
      ),
    );
  }
}
