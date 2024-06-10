import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/localization/controller/l10n_controller.dart';
import 'config/localization/l10n/l10n.dart';
import 'config/navigation/navigation.dart';
import 'config/theme/theme.dart';
import 'core/services/notifications/notification_fcm.dart';
import 'core/utils/constants.dart';
import 'di_container.dart' as di;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  NotificationsFCM();
  FirebaseMessaging.onBackgroundMessage(NotificationsFCM.firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      theme: lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: Pages.pages,
      translations: L10n(),
      locale: Get.put(di.sl<L10nController>()).appLocale ?? Get.deviceLocale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.localizationDelegates,
      builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
    );
  }
}
