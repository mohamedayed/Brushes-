// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../../core/resources/resources.dart';
// import '../../../core/utils/constants.dart';
// import '../../../core/view/views.dart';
// import '../../../models/booking_model.dart';
// import '../../rating/controllers/rating_controller.dart';
//
// class RatingDialog extends GetView<RatingController> {
//   final bool isBooking;
//   final Booking booking;
//
//   const RatingDialog({@required this.isBooking, this.booking, Key key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: EdgeInsets.symmetric(horizontal: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       child: Stack(
//         clipBehavior: Clip.none,
//         fit: StackFit.loose,
//         children: [
//           Container(
//             clipBehavior: Clip.antiAlias,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: AppColors.ratingStar),
//             ),
//             foregroundDecoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: AppColors.ratingStar),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   height: 52,
//                   color: AppColors.ratingLightGold,
//                   alignment: AlignmentDirectional.centerStart,
//                   padding: EdgeInsets.all(8),
//                   child: InkWell(
//                     onTap: () => Get.back(),
//                     child: Container(
//                       width: 34,
//                       height: 34,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: AppColors.white),
//                         borderRadius: BorderRadius.circular(5),
//                         color: AppColors.white.withOpacity(0.5),
//                       ),
//                       child: CustomIcon(Icons.close),
//                     ),
//                   ),
//                 ),
//                 VerticalSpace(14),
//                 CustomText("How was your experience".tr),
//                 VerticalSpace(16),
//                 RatingBar(
//                   initialRating: 3,
//                   direction: Axis.horizontal,
//                   itemCount: 5,
//                   itemPadding: EdgeInsets.symmetric(horizontal: 4),
//                   onRatingUpdate: (value) {
//                     controller.review.update((val) {
//                       val.rate = value;
//                     });
//                   },
//                   ratingWidget: RatingWidget(
//                     full: const RatingStar(color: AppColors.ratingStar),
//                     empty: const RatingStar(color: AppColors.lightGrey),
//                     half: const RatingStar(color: AppColors.lightGrey),
//                   ),
//                 ),
//                 VerticalSpace(32),
//                 Align(
//                   alignment: AlignmentDirectional.centerStart,
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8),
//                     child: CustomText("Add Comment".tr),
//                   ),
//                 ),
//                 VerticalSpace(16),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: CustomTextField(
//                     labelText: "Write your review".tr,
//                     hintText: "Tell us somethings about this salon services".tr,
//                     maxLines: 5,
//                     minLines: 5,
//                     onChanged: (text) {
//                       controller.review.update((val) {
//                         val.review = text;
//                       });
//                     },
//                   ),
//                 ),
//                 VerticalSpace(16),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: CustomButton(
//                       onPressed: () {
//                         controller.addReview(booking);
//                       },
//                       text: "Send".tr),
//                 ),
//                 VerticalSpace(16),
//               ],
//             ),
//           ),
//           isBooking
//               ? PositionedDirectional(
//                   top: -46,
//                   start: 0,
//                   end: 0,
//                   child: Center(
//                     child: Container(
//                       height: 92,
//                       width: 92,
//                       clipBehavior: Clip.antiAlias,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: AppColors.ratingStar),
//                       ),
//                       foregroundDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border: Border.all(color: AppColors.ratingStar),
//                       ),
//                       child: CustomNetworkImage(
//                         image: isBooking
//                             ? booking.user.avatar.url
//                             : Constants.hairClipper,
//                         height: 92,
//                         width: 92,
//                       ),
//                     ),
//                   ),
//                 )
//               : SizedBox()
//         ],
//       ),
//     );
//   }
// }
