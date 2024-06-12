import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../profile/models/responses/user_model.dart';

class Message {
  String id = UniqueKey().toString();
  String? text;
  int? time;
  int? userId;
  UserModel? user;

  Message(this.text, this.time, this.userId, this.user);

  Message.fromDocumentSnapshot(DocumentSnapshot json) {
    try {
      id = json.id;
      text = json.get('text')?.toString() ?? "";
      time = json.get('time') ?? 0;
      userId = json.get('user') ?? 0;
    } catch (e) {
      id = "";
      text = '';
      time = 0;
      user = null;
      userId = null;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "text": text,
      "time": time,
      "user": userId,
    };
  }
}
