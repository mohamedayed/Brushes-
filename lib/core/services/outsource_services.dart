import '../resources/resources.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/alerts.dart';

class OutsourceServices {
  static Future<void> launch(String url) async {
    final Uri link = Uri.parse(url);
    final bool canLaunch = await canLaunchUrl(link);
    if (canLaunch) {
      await launchUrl(link);
    } else {
      Alerts.showToast(AppStrings.msgUnknownError.tr);
    }
  }
}
