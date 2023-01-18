import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vchat/controller/message_controller/message_controller.dart';
import 'package:vchat/core/color/colours.dart';
import 'package:vchat/model/message_model.dart';
import 'package:vchat/view/home/home_screen.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final messageController = Get.put(MessageController());
  final messageTextEdingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final fireBaseAuth = FirebaseAuth.instance; 
final isUserLog =  fireBaseAuth.currentUser;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: commonColorDeepPurple,
          title: const Text('chat'),
          actions: [
            GestureDetector(
                onTap: () async {
                  final fireBaseAuth = FirebaseAuth.instance;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false);
                  await fireBaseAuth.signOut();
                },
                child: const Icon(Icons.login))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: Obx(() {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: messageController.messageData.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                         CircleAvatar(
                          backgroundColor: commonColorDeepPurple,
                          child: Text(
                            messageController.messageData[index].user,
                            style: const TextStyle(fontWeight: FontWeight.bold), 
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Card(
                              color: const Color.fromARGB(255, 221, 218, 218),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 8, top: 8),
                                child: Text(
                                    messageController.messageData[index].qustion),
                              ),
                            ),
                          ),
                        ))
                      ],
                    );
                  },
                ),
              );
            })),

        
            Obx( 
               () {
                return messageController.isLoading.value ? SizedBox( 
                  
                  height: 60,
                  width: 150,
                  child: Lottie.asset('assets/10357-chat-typing-indicator.json')) : SizedBox(); 
              }
            ),  
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: messageTextEdingController,
                cursorColor: commonColorDeepPurple,
                decoration: InputDecoration(
                    hintText: 'Ask any thing',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: commonColorDeepPurple,
                          width: 2.1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        )),
                    suffixIcon: InkWell(
                      onTap: () {
                        final userData = isUserLog!.email!.toUpperCase();
                        log(userData[0]); 
                        if (messageTextEdingController.text.isEmpty) {

                          return;
                        } else {
                          final data = MessagModel(
                              qustion: messageTextEdingController.text,
                              user: userData[0]); 
                          messageController.addMessage(data);
                          messageTextEdingController.clear();
                        }
                      },
                      child: const Icon(
                        Icons.send,
                        color: commonColorDeepPurple,
                      ),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            )
          ],
        ));
  }
}
