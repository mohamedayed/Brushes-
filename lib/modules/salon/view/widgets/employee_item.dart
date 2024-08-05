import '../../../../core/view/views.dart';
import '../../../profile/models/responses/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class EmployeeItem extends StatelessWidget {
  final UserModel employee;

  const EmployeeItem(this.employee, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.EMPLOYEE_Details),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomImage(image: employee.avatar.url, height: double.infinity, width: 120, borderRadius: 6),
          ),
          const VerticalSpace(6),
          CustomText(
            employee.name,
            fontSize: 12,
            maxLines: 1,
            fontWeight: FontWeightManager.semiBold,
            autoSized: true,
            textAlign: TextAlign.center,
          ),
          CustomText(
            employee.role,
            fontSize: 10,
            maxLines: 1,
            autoSized: true,
            color: AppColors.gray300,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
