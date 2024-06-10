import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/modules/layout/controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bnb_item.dart';

class LayoutScreen extends GetWidget<LayoutController> {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.setIndex,
          items: [
            BNBItem(context, title: AppStrings.home.tr, sign: AppIcons.home, activeSign: AppIcons.homeActive),
            BNBItem(context, title: AppStrings.store.tr, sign: AppIcons.shop, activeSign: AppIcons.shopActive),
            BNBItem(context, title: AppStrings.bookings.tr, sign: AppIcons.todo, activeSign: AppIcons.todoActive),
            BNBItem(context, title: AppStrings.chats.tr, sign: AppIcons.message, activeSign: AppIcons.messageActive),
            BNBItem(context, title: AppStrings.account.tr, sign: AppIcons.profile, activeSign: AppIcons.profileActive),
          ],
        ),
      ),
    );
  }
}
