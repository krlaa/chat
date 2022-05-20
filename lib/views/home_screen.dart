import 'package:chat/controllers/globalstate_controller.dart';
import 'package:chat/views/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<GlobalState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {
                    controller.textController = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter your name!',
                      border: OutlineInputBorder()),
                )),
            ElevatedButton(
                onPressed: () {
                  controller.logInUser();
                  Get.to(ChatScreen());
                },
                child: Text('ENTER ROOM'))
          ],
        ));
  }
}
