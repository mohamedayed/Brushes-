/*
 * File name: notifications_button_widget.dart
 * Last modified: 2023.01.26 at 18:24:12
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2023
 */

import 'package:brushes/config/navigation/routes.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/modules/layout/controller/layout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/resources/resources.dart';
import '../../../../core/view/views.dart';

class NotificationsButtonWidget extends GetWidget<LayoutController> {
  const NotificationsButtonWidget({super.key});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.invokeIfAuthenticated(callback: () => Get.toNamed(Routes.notificationsScreen)),
      child: Badge(
        label: Obx(() => Text(controller.notificationsCount.value.toString())),
        backgroundColor: AppColors.primary,
        alignment: AlignmentDirectional.topStart,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray200),
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Center(child: CustomIcon.svg(AppIcons.bell, size: AppSize.s24)),
        ),
      ),
    );
  }
}
