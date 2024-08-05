import '../../../../core/resources/resources.dart';
import 'package:flutter/material.dart';
import '../../../../core/view/views.dart';
import '../../../e_service/models/responses/e_service_model.dart';
import '../../../e_service/view/widgets/service_item.dart';
import 'title_row.dart';

class HomeServicesComponent extends StatelessWidget {
  final String title;
  final List<EService> services;
  final VoidCallback? onActionPressed;

  const HomeServicesComponent({
    required this.title,
    required this.services,
    this.onActionPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpace(10),
        TitleRow(title: title,viewMoreColor: AppColors.warning, onActionPressed: onActionPressed),
        const VerticalSpace(16),
        SizedBox(
          height: 256,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ServiceItem(flexibleDimensions: false, service: services[index]),
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemCount: services.length,
          ),
        ),
      ],
    );
  }
}
