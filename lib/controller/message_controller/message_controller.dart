import 'dart:async';
import 'dart:developer';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:vchat/core/api/chat_gpt.dart';
import 'package:vchat/model/message_model.dart';

class MessageController extends GetxController {
  RxList<MessagModel> messageData = <MessagModel>[].obs;
  RxBool isLoading = false.obs;
  ChatGPT? chatGPTApi;

  StreamSubscription? _streamSubscription;

  void addMessage(MessagModel data) {
    isLoading.value = true;
    messageData.add(data);
  

   try{
      final requseData = CompleteReq(
        prompt: data.qustion, model: kTranslateModelV3, max_tokens: 600);

     _streamSubscription = chatGPTApi!
        .builder(ChatApi.chatUri) 
        .onCompleteStream(request: requseData)
        .listen((event) {

          
      final chatAns =
          MessagModel(qustion: event?.choices[0].text ?? '', user: 'B');
      isLoading.value = false;
      messageData.add(chatAns);
    });
   }catch(e){
    log(e.toString()); 
  isLoading.value = false; 

   }
  }

  @override
  void onInit() {
    chatGPTApi = ChatGPT.instance;
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }
}
