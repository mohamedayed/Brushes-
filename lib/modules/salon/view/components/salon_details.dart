import '../../../../core/resources/resources.dart';
import '../../../../core/services/outsource_services.dart';
import '../../controller/salon_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/view/views.dart';
import '../../../home/view/components/title_row.dart';
import '../widgets/availability_item.dart';
import '../widgets/employee_item.dart';
import '../widgets/rating_item.dart';

class SalonDetails extends GetView<SalonDetailsController> {
  const SalonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: CustomText(AppStrings.contactUs.tr, fontWeight: FontWeight.w300),
            subtitle: CustomText(AppStrings.ifYouHaveAnyQuestions.tr, fontWeight: FontWeight.w400),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedIconButton(
                  height: 36,
                  width: 36,
                  icon: AppIcons.call,
                  iconColor: AppColors.black,
                  onTap: () => OutsourceServices.launch("tel:${controller.salon.value!.phoneNumber}"),
                ),
                HorizontalSpace(12),
                OutlinedIconButton(
                  height: 36,
                  width: 36,
                  icon: AppIcons.mobile,
                  onTap: () => OutsourceServices.launch("tel:${controller.salon.value!.mobileNumber}"),
                ),
                HorizontalSpace(12),
                OutlinedIconButton(
                  height: 36,
                  width: 36,
                  icon: AppIcons.messages,
                  onTap: controller.startChat,
                ),
              ],
            ),
          ),
          VerticalSpace(22),
          TitleRow(title: AppStrings.employees.tr),
          VerticalSpace(16),
          controller.salon.value!.employees.isEmpty
              ? CustomEmptyListSmallWidget(title: AppStrings.noWorkers.tr)
              : SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: controller.salon.value!.employees.length,
                    itemBuilder: (context, index) => EmployeeItem(controller.salon.value!.employees[index]),
                    separatorBuilder: (context, index) => HorizontalSpace(16),
                  ),
                ),
          VerticalSpace(22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(AppStrings.availability.tr, fontWeight: FontWeightManager.medium, fontSize: FontSize.s16),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: controller.salon.value!.closed ? AppColors.grey100 : AppColors.primary.withOpacity(0.1),
                  ),
                  child: CustomText(
                    controller.salon.value!.closed ? AppStrings.closed.tr : AppStrings.open.tr,
                    color: controller.salon.value!.closed ? AppColors.black : AppColors.primary,
                    fontSize: 10,
                  ),
                )
              ],
            ),
          ),
          VerticalSpace(16),
          SizedBox(
            height: AppSize.s56,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.salon.value!.groupedAvailabilityHours.entries.length,
              itemBuilder: (context, index) {
                final availabilityHour = controller.salon.value!.groupedAvailabilityHours.entries.elementAt(index);
                final data = controller.salon.value!.getAvailabilityHoursData(availabilityHour.key);
                return AvailabilityItem(availabilityHour: availabilityHour, data: data);
              },
              separatorBuilder: (context, index) => HorizontalSpace(10),
            ),
          ),
          VerticalSpace(22),
          TitleRow(title: "${AppStrings.reviewsAndRatings.tr} (${controller.salon.value!.totalReviews})"),
          controller.salon.value!.reviews.isEmpty
              ? CustomEmptyListSmallWidget(title: AppStrings.noComments.tr)
              : Column(
                  children: [
                    const VerticalSpace(20),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) => RatingItem(controller.salon.value!.reviews[index]),
                      separatorBuilder: (context, index) => const Divider(color: AppColors.gray200),
                      itemCount: controller.salon.value!.reviews.length,
                    ),
                  ],
                ),
          VerticalSpace(76),
        ],
      ),
    );
  }
}
