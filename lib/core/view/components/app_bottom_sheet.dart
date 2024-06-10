import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s10)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
