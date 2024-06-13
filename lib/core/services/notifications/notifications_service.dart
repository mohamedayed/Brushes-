import 'package:get/get.dart';

class NotificationsService {
  static Rx<int> currentNotificationsCount = Rx(0);

  void setCurrentNotificationsCount(int count) async {
    currentNotificationsCount(count);
  }

  void onCurrentAddressChanged(void Function(int) onChanged) {
    currentNotificationsCount.listen((newCount) {
      onChanged(currentNotificationsCount.value);
    });
  }
}
