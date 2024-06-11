import 'package:get/get.dart';

import '../../../di_container.dart';
import '../controller/book_service_controller.dart';

class BookServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<BookServiceController>());
  }
}
