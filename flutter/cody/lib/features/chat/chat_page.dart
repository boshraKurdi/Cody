import 'dart:convert';
import 'package:cody/common%20wedgit/custtom_search_text_feild.dart';
import 'package:cody/features/chat/wedgits/add_new_project_form.dart';
import 'package:cody/features/chat/wedgits/add_to_an_exested_project_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../common wedgit/custtom_textfield.dart';
import '../../common wedgit/drop_down_list.dart';
import '../../common wedgit/show_dialoge_messeage.dart';
import '../../constants/colo_extension.dart';
import '../../constants/names.dart';
import '../../constants/styles.dart';
import '../home/home_page.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  static GlobalKey<FormState> completeKey = GlobalKey();
  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add({'user': message});
      _messages.add({'bot': message});
    });
    _controller.clear();

    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer $openAIAPIKey',
      },
      body: jsonEncode({
        'prompt': message,
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final reply = data['choices'][0]['text'].trim();
      setState(() {
        _messages.add({'bot': reply});
      });
    } else {
      print('Failed to get response: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: () {
                    GoRouter.of(context).pushNamed(Names.RegisterPage);
                  },
                    child: Image(
                      image: AssetImage(
                        'assets/img/burger-menu-svgrepo-com.png',
                      ),
                      width: 50,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image(
                      image: AssetImage(
                        'assets/img/4260937.png',
                      ),
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: TColor.blueColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CusttomAppAssetImage(
                          image:
                              'assets/img/vecteezy_robot-chatbot-aesthetic_25271430.png',
                          width: 40),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Chat With Cody',
                    style: TextStyle(
                        color: TColor.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 1,
              color: TColor.primaryColor2,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUserMessage = message.containsKey('user');
                  return Column(
                    children: [
                      Align(
                        alignment: isUserMessage
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: isUserMessage
                                  ? TColor.secondaryColor2
                                  : TColor.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  width: 1, color: TColor.blueColor)),
                          child: Text(isUserMessage
                              ? message['user']!
                              : message['bot']!),
                        ),
                      ),
                      isUserMessage ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      showErrorDialogMesseage(
                                        context1: context,
                                        ontaptry: () {},
                                        ontapcancel: () {
                                          GoRouter.of(context).pop();
                                        },
                                        buttonText: 'add',
                                        widget: AddToAnExextedProjectMessage(),
                                      );
                                    },
                                    icon: Icon(
                                        Icons.dashboard_customize_rounded)),
                                IconButton(
                                    onPressed: () {
                                      showErrorDialogMesseage(
                                        context1: context,
                                        ontaptry: () {},
                                        ontapcancel: () {
                                          GoRouter.of(context).pop();
                                        },
                                        buttonText: 'add',
                                        widget: AddNewProjectForm(completeKey: completeKey, textControllers: textControllers),
                                      );
                                    },
                                    icon: Icon(
                                        Icons.dashboard_customize_outlined))
                              ],
                            )
                          : SizedBox()
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CusttomSearchTextFeild(
                      txtSearch: _controller,
                      SearshTestHint: 'Enter your message',
                      dropDownListItems: [],
                      onChanged: (p0) {
                        if (_controller.text.isNotEmpty) {
                          _sendMessage(_controller.text);
                        }
                      },
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        gradient: TColor.kmainGradint,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Icon(
                        Icons.search_rounded,
                        color: TColor.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
