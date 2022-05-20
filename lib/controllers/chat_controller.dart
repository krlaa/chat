import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import 'globalstate_controller.dart';

class ChatController extends GetxController with StateMixin {
  var server = IOWebSocketChannel.connect(Uri.parse('ws://localhost:3000'));
  var _chats = [].obs;
  var globalState = Get.find<GlobalState>();
  var _myListKey = GlobalKey<AnimatedListState>().obs;
  var _chatMessageTC = TextEditingController().obs;

  get chats => chats.value;
  get myListKey => _myListKey.value;
  get chatMessageTC => chatMessageTC.value;
  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    server.stream.listen((msg) {
      change(null, status: RxStatus.success());
      chats.add(msg);
      update();
      myListKey.currentState?.insertItem(0);
    });
  }

  addmessage() {
    server.sink.add('d');
    chats.add('d');
  }
}
