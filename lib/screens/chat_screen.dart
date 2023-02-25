import 'package:chat_gpt/services/assets_manager.dart';
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
                    return const Text("hello GPt");
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
                      style: const TextStyle(color: Colors.white),
                      controller: textEditingController,
                      onSubmitted: (value) {},
                      decoration: const InputDecoration.collapsed(
                          hintText: "How can I help you",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {},
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
