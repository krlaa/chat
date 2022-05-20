import 'package:chat/controllers/chat_controller.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GlobalState extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var _currentUser = User.empty().obs;
  var _tController = TextEditingController().obs;

  // This function will log the user in and set the currentUser to be filled with a User with a name entered from the HomeScreen TextField
  void logInUser() async {
    var user = User(name: textController);
    _currentUser.value = user;
  }

  get user => _currentUser.value;

  get textController => _tController.value.text;
  set textController(text) => _tController.value.text = text;
}
