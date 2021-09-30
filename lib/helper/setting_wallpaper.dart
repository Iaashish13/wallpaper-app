import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class SetWallpaper {
  Future<void> setWallpaperHomeScreen(String url) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      // ignore: avoid_print
      print(result);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> setWallpaperLockScreen(String url) async {
    try {
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      // ignore: avoid_print
      print(result);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> setWallpaperBothScreen(String url) async {
    try {
      int location = WallpaperManager.BOTH_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(url);
      bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      // ignore: avoid_print
      print(result);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
