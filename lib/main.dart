import 'package:chat/controllers/chat_controller.dart';
import 'package:chat/controllers/globalstate_controller.dart';
import 'package:chat/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() async {
  var channel = IOWebSocketChannel.connect(Uri.parse('ws://localhost:3000'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: () {
        Get.put(GlobalState());
        Get.put(ChatController());
      },
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomeScreen(),
    );
  }
}
