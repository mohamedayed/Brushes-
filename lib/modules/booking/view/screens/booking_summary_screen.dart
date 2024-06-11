import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/utils/utils.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/booking/view/components/booking_summary_bottom_widget.dart';
import 'package:brushes/modules/booking/view/components/booking_summary_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/booking_summary_controller.dart';

class BookingSummaryScreen extends GetWidget<BookingSummaryController> {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(title: AppStrings.bookingSummary.tr),
      body: ListView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 5),
        children: [
          BookingSummaryContainer(
            title: AppStrings.bookingAt.tr,
            icon: Icons.calendar_today_outlined,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  DateFormat.yMMMMEEEEd(Get.locale.toString()).format(
                    DateTime.parse(controller.bookingBody.bookingTime!),
                  ),
                  fontWeight: FontWeightManager.bold,
                ),
                CustomText(
                  DateFormat('HH:mm', Get.locale.toString()).format(
                    DateTime.parse(controller.bookingBody.bookingTime!),
                  ),
                  fontWeight: FontWeightManager.bold,
                ),
              ],
            ),
          ),
          BookingSummaryContainer(
            title: controller.bookingBody.address != null
                ? AppStrings.yourAddress.tr
                : Utils.localizedValue(context, controller.bookingBody.salon!.name),
            icon: Icons.place_outlined,
            child: CustomText(
              controller.bookingBody.address == null
                  ? controller.bookingBody.salon!.address.address
                  : controller.bookingBody.address!.address,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          if (controller.bookingBody.hint != null && controller.bookingBody.hint != "")
            BookingSummaryContainer(
              title: AppStrings.hint.tr,
              icon: Icons.description_outlined,
              child: CustomText(controller.bookingBody.hint!, fontWeight: FontWeightManager.bold),
            ),
        ],
      ),
      bottomNavigationBar: const BookingSummaryBottomWidget(),
    );
  }
}
