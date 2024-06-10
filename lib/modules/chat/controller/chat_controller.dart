import 'package:get/get.dart';

import '../repositories/chat_repo.dart';

class ChatController extends GetxController {
  final ChatRepo _chatRepo;

  ChatController(this._chatRepo);
}
