// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../config/navigation/navigation.dart';
// import '../../../../core/resources/resources.dart';
// import '../../../../core/view/views.dart';
//
// class AddressWidget extends StatelessWidget {
//   final bool hasMargin;
//
//   const AddressWidget({super.key, this.hasMargin = true});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Get.toNamed(Routes.addressesScreen),
//       child: Container(
//         margin: hasMargin ? const EdgeInsets.symmetric(vertical: 0, horizontal: 16) : EdgeInsets.zero,
//         padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
//         decoration:
//             BoxDecoration(border: Border.all(color: AppColors.grey100), borderRadius: BorderRadius.circular(6.0)),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(6.0)),
//               child: const CustomIcon.svg(AppIcons.location, color: AppColors.primary, size: 18),
//             ),
//             SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(AppStrings.yourLocation.tr, fontSize: 12),
//                   VerticalSpace(2),
//                   Obx(
//                     () {
//                       if (Get.find<SettingsService>().address.value?.isUnknown() ?? true) {
//                         return Text(
//                           "Please choose your address".tr,
//                           style: Get.textTheme.bodyLarge,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         );
//                       }
//                       return Text(
//                         Get.find<SettingsService>().address.value.address,
//                         style: Get.textTheme.bodyLarge,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(width: 10),
//             CustomIcon(Icons.arrow_forward_ios, size: 16, color: AppColors.gray200)
//           ],
//         ),
//       ),
//     );
//   }
// }
