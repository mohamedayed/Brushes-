import '../../../di_container.dart';
import 'package:get/get.dart';

import '../controller/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => sl<ChatController>());
  }
}
