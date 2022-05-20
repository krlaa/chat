import 'package:chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:web_socket_channel/io.dart';

class ChatScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ChatController>();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addmessage();
            print(controller.chats);
          },
        ),
        body: Container(
            child: controller.obx((state) {
          return Column(
            children: [
              Expanded(
                child: AnimatedList(
                  key: controller.myListKey,
                  initialItemCount: controller.chats.length,
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      sizeFactor: animation,
                      child: Text(controller.chats[index]),
                    );
                  },
                ),
              ),
              TextField()
            ],
          );
        }, onEmpty: Center(child: Text('Waiting for someone...')))),
      ),
    );
  }
}
