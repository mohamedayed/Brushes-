import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/responses/e_service_model.dart';
import '../repositories/e_service_repo.dart';
import '../../../core/utils/alerts.dart';

class EServiceDetailsController extends GetxController {
  final EServiceRepo _eServiceRepo;

  EServiceDetailsController(this._eServiceRepo);

  Rx<EService?> eService = Rx<EService?>(null);
  RxBool isLoading = false.obs;
  late final int id;
  final PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments['id'];
    getEService();
  }

  Future<void> getEService() async {
    isLoading(true);
    final result = await _eServiceRepo.getEService(id);
    result.fold(
      (failure) => Alerts.showSnackBar(message: failure.message, onActionPressed: getEService),
      (service) => eService(service),
    );
    isLoading(false);
  }
}
