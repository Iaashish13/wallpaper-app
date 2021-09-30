import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_app/helper/setting_wallpaper.dart';
import 'package:wallpaper_app/widget/used_widgets.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  _save(String url) async {
    var status = Platform.isAndroid
        ? await Permission.storage.request()
        : await Permission.photos.request();
    if (status.isGranted) {
      final response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
      );
      // ignore: avoid_print
      print(result);
    }
  }

  void showSnackBar(String details) {
    final snackBar = SnackBar(
      content: Text(
        details,
        textAlign: TextAlign.center,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
      ),
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 64.0),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: widget.imageUrl,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24.0),
                          )),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  textButton(context, 'Set as HomeScreen', () {
                                    SetWallpaper().setWallpaperHomeScreen(
                                        widget.imageUrl);
                                    _save(widget.imageUrl);
                                    Navigator.pop(context);
                                    showSnackBar(
                                        'Wallpaper Applied to HomeScreen');
                                  }),
                                  textButton(context, 'Set as LockScreen', () {
                                    SetWallpaper().setWallpaperLockScreen(
                                        widget.imageUrl);
                                    _save(widget.imageUrl);
                                    Navigator.pop(context);
                                    showSnackBar(
                                        'Wallpaper Applied to LockScreen');
                                  }),
                                  textButton(context, 'Set Both', () {
                                    SetWallpaper().setWallpaperBothScreen(
                                        widget.imageUrl);
                                    _save(widget.imageUrl);
                                    Navigator.pop(context);
                                    showSnackBar(
                                        'Wallpaper Applied to Both Screen');
                                  }),
                                ],
                              ),
                            );
                          });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white60, width: 1.0),
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: const LinearGradient(colors: [
                        Color(0x36FFFFFF),
                        Color(0x0FFFFFFF),
                      ]),
                    ),
                    child: Column(
                      children: const <Widget>[
                        Text('Set Wallpaper',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0)),
                        Text(
                          'Image will be saved on gallery',
                          style: TextStyle(color: Colors.black, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                const SizedBox(
                  height: 36.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
