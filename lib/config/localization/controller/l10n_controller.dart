import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/local/cache_client.dart';
import '../../../core/services/local/storage_keys.dart';
import '../../../core/services/network/api_client.dart';
import '../../../di_container.dart';
import '../l10n/l10n.dart';

class L10nController extends GetxController {
  final CacheClient _cacheClient;

  L10nController(this._cacheClient);

  Locale? appLocale;

  void initLocale() {
    dynamic storedLocale = _cacheClient.get(StorageKeys.appLocale);
    if (storedLocale != null) {
      appLocale = Locale(storedLocale.toString());
    } else {
      final List<String> supportedLangCodes = L10n.supportedLocales.map((e) => e.languageCode).toList();
      final String deviceLangCode = Platform.localeName.substring(0, 2);
      if (!supportedLangCodes.contains(deviceLangCode)) {
        // Device locale not supported, Then set default locale to english
        appLocale = L10n.supportedLocales[0];
      } else {
        appLocale = L10n.supportedLocales[1];
        // appLocale = Locale(deviceLangCode);
      }
    }
  }

  Future<void> setAppLocale(bool isArabic) async {
    if (isArabic) {
      appLocale = L10n.supportedLocales[1];
      sl<ApiClient>().changeLocale("ar");
      await _cacheClient.save(StorageKeys.appLocale, "ar");
    } else {
      appLocale = L10n.supportedLocales[0];
      sl<ApiClient>().changeLocale("en");
      await _cacheClient.save(StorageKeys.appLocale, "en");
    }
    Get.updateLocale(appLocale!);
  }
}
