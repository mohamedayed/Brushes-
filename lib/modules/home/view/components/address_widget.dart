// /*
//  * File name: address_widget.dart
//  * Last modified: 2023.01.26 at 18:24:51
//  * Author: SmarterVision - https://codecanyon.net/user/smartervision
//  * Copyright (c) 2023
//  */
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../core/resources/app_assets.dart';
// import '../../core/resources/app_colors.dart';
// import '../../core/view/views.dart';
// import '../../routes/app_routes.dart';
// import '../../services/settings_service.dart';
//
// class AddressWidget extends StatelessWidget {
//   final bool hasMargin;
//
//   AddressWidget({this.hasMargin = true});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: hasMargin ? const EdgeInsets.symmetric(vertical: 0, horizontal: 16) : EdgeInsets.zero,
//       padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
//       decoration: BoxDecoration(border: Border.all(color: AppColors.grey150), borderRadius: BorderRadius.circular(6.0)),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(color: AppColors.grey100, borderRadius: BorderRadius.circular(6.0)),
//             child: CustomIcon.svg(AppIcons.location, color: AppColors.primary, size: 18),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: GestureDetector(
//               onTap: () {
//                 Get.toNamed(Routes.SETTINGS_ADDRESSES);
//               },
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText("Your Location".tr, fontWeight: FontWeight.normal, fontSize: 12),
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
//           ),
//           SizedBox(width: 10),
//           CustomIcon(Icons.arrow_forward_ios, size: 16, color: AppColors.lightGrey3)
//         ],
//       ),
//     );
//   }
// }
