import '../../../core/services/notifications/notifications_service.dart';
import '../../../core/utils/globals.dart';
import '../../../core/utils/utils.dart';
import '../../account/view/screens/account_screen.dart';
import '../../booking/view/screens/my_bookings_screen.dart';
import '../../chat/view/screens/chats_screen.dart';
import '../../home/controller/home_controller.dart';
import '../../notifications/repositories/notifications_repo.dart';
import '../../products/view/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/services/address/address_service.dart';
import '../../../core/utils/alerts.dart';
import '../../home/view/screens/home_screen.dart';

class LayoutController extends GetxController {
  final NotificationsRepo _notificationsRepo;
  final AddressService _addressService;
  final NotificationsService _notificationsService;

  LayoutController(this._notificationsRepo, this._addressService, this._notificationsService);

  @override
  void onInit() {
    super.onInit();
    Get.find<HomeController>().getHomeSliders();
    Get.find<HomeController>().getParentCategories();
    Get.find<HomeController>().getFeaturedCategories();
    if (currentUser.value != null) getNotificationsCount();

    _addressService.setCurrentAddress();
    _addressService.onCurrentAddressChanged((address) {
      Get.find<HomeController>().getNearSalons();
    });
  }

  RxInt currentIndex = 0.obs;

  List<Widget> screens = const [
    HomeScreen(),
    ProductsScreen(),
    MyBookingsScreen(),
    ChatsScreen(),
    AccountScreen(),
  ];

  void setIndex(int? index) {
    if (index == 2 || index == 3 || index == 4) {
      Utils.invokeIfAuthenticated(callback: () => currentIndex(index));
    } else {
      currentIndex(index);
    }
  }

  Future<void> getNotificationsCount() async {
    final result = await _notificationsRepo.getNotificationsCount();
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getNotificationsCount),
      (notificationsCount) => _notificationsService.setCurrentNotificationsCount(notificationsCount),
    );
  }
}
