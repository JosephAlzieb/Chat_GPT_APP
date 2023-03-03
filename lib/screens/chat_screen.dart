import 'dart:developer';

import 'package:chat_gpt/constants/constants.dart';
import 'package:chat_gpt/services/api_services.dart';
import 'package:chat_gpt/services/assets_manager.dart';
import 'package:chat_gpt/services/services.dart';
import 'package:chat_gpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = true;
  late TextEditingController textEditingController;
  late FocusNode focusNode;

  @override
  void initState() {
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.openaiLogo),
          ),
          title: const Text("ChatGPT"),
          actions: [
            IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (ctx, index) {
                    return const ChatCard(
                        msg: "Hello Boot"
                            "fwefewfwefwefewfewfwef ewfewfef"
                            "wef  efef  efefwefwefwffewfweff"
                            "wefwefwefwfwef wfwfff  f wf  wf",
                        chatIndex: 1);
                  },
                ),
              ),
              if (isTyping) ...[
                const SpinKitThreeBounce(
                  color: Colors.white,
                  size: 25,
                )
              ],
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: focusNode,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      controller: textEditingController,
                      onSubmitted: (value) {},
                      decoration: const InputDecoration.collapsed(
                          hintText: "How can I help you",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        try{
                          await ApiService.getModels();
                        }catch(e){
                          print(e);
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 40,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
