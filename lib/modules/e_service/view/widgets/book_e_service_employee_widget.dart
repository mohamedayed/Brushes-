import 'package:brushes/core/resources/resources.dart';
import 'package:brushes/core/view/views.dart';
import 'package:brushes/modules/e_service/controller/book_service_controller.dart';
import 'package:brushes/modules/profile/models/responses/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookEServiceEmployeeWidget extends GetView<BookServiceController> {
  final UserModel employee;

  const BookEServiceEmployeeWidget(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => controller.selectEmployee(employee),
      child: Obx(
        () {
          return Stack(
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    // color: Get.theme.colorScheme.primary.withOpacity(controller.isCheckedEmployee(employee) ? 0.8 : 0),
                  ),
                ),
                padding: EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: CustomImage(width: double.infinity, fit: BoxFit.cover, image: employee.avatar.thumb),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomText(employee.name, maxLines: 1),
                  ],
                ),
              ),
              Container(
                height: 25,
                width: 25,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  // color: AppColors.primary.withOpacity(controller.isCheckedEmployee(employee) ? 0.8 : 0),
                ),
                child: Icon(
                  Icons.check,
                  size: 20,
                  // color: AppColors.primary.withOpacity(controller.isCheckedEmployee(employee) ? 1 : 0),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
