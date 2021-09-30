import 'package:flutter/material.dart';
import 'package:wallpaper_app/helper/category_data.dart';
import 'package:wallpaper_app/helper/networking.dart';
import 'package:wallpaper_app/models/category_model.dart';
import 'package:wallpaper_app/models/photos_model.dart';
import 'package:wallpaper_app/screens/search_scren.dart';


import 'package:wallpaper_app/widget/category_tile.dart';
import 'package:wallpaper_app/widget/used_widgets.dart';
import 'package:wallpaper_app/widget/wallpaper_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> _categories = List<CategoryModel>.empty(growable: true);
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle(),
        backgroundColor: Colors.white,
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
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                      
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search..',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchScreen(
                                searchQuery: _searchController.text,
                              ),
                            ),
                          );
                       
                        },
                        child: const Icon(
                          Icons.search,
                          size: 26.0,
                        ),
                      ),
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
                          imageUrl: _categories[index].imageUrl);
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
