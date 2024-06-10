import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../resources/resources.dart';
import 'alerts.dart';

class Pickers {
  static Future<File?> pickImage(BuildContext context, {bool fromGallery = true}) async {
    try {
      if (fromGallery) {
        final assets = await AssetPicker.pickAssets(context, pickerConfig: const AssetPickerConfig(maxAssets: 1));
        if (assets != null) {
          final assetFile = await assets[0].file;
          return assetFile;
        }
      } else {
        XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
        return image != null ? File(image.path) : null;
      }
    } on PlatformException catch (_) {
      Alerts.showToast(AppStrings.msgUnknownError.tr);
      return null;
    }
    return null;
  }

  static Future<List<File>> pickMultiImages(BuildContext context, {bool useWeChatAssets = true}) async {
    try {
      if (useWeChatAssets) {
        final assets = await AssetPicker.pickAssets(context);
        if (assets != null) {
          final List<File> images = [];
          for (var asset in assets) {
            final assetFile = await asset.file;
            if (assetFile != null) images.add(assetFile);
          }
          return images;
        }
      } else {
        final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
        final List<File> images = [];
        for (var image in selectedImages) {
          images.add(File(image.path));
        }
        return images;
      }
    } on PlatformException catch (_) {
      Alerts.showToast(AppStrings.msgUnknownError.tr);
      return [];
    }
    return [];
  }
}
