import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/modules/booking/controller/my_bookings_controller.dart';
import 'package:brushes/modules/booking/models/responses/booking_model.dart';
import 'package:brushes/modules/booking/view/widgets/booking_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';
import '../../../home/view/components/notifications_button_widget.dart';

class MyBookingsScreen extends GetWidget<MyBookingsController> {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MainAppbar(
            showDefaultBackButton: false,
            title: AppStrings.bookings.tr,
            actions: const [SizedBox(width: 46, height: 46, child: NotificationsButtonWidget())],
          ),
          Obx(
            () {
              return DefaultTabController(
                length: controller.bookingStatuses.length,
                child: TabBar(
                  onTap: (index) => controller.selectedBookingStatus(controller.bookingStatuses[index]),
                  unselectedLabelColor: Colors.black,
                  dividerHeight: AppSize.s1,
                  dividerColor: AppColors.gray300,
                  indicator: BoxDecoration(color: controller.selectedBookingStatus.value?.color ?? AppColors.black),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: List.generate(
                    controller.bookingStatuses.length,
                    (index) => Tab(
                      child: CustomText(
                        controller.bookingStatuses[index].status,
                        fontWeight: FontWeightManager.bold,
                        color: controller.selectedBookingStatus.value == controller.bookingStatuses[index]
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Obx(() {
              controller.selectedBookingStatus.value;
              return PaginatedListView<Booking>(
                key: UniqueKey(),
                padding: const EdgeInsets.all(AppPadding.p16),
                fetchData: (page) => controller.getBookings(page: page),
                onListItemsChange: (booking) => controller.bookings(booking),
                child: (index) => BookingItem(inList: true, booking: controller.bookings[index]),
                separator: (int index) => const VerticalSpace(AppSize.s12),
              );
            }),
          )
        ],
      ),
    );
  }
}
