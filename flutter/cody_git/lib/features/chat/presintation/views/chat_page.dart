import 'dart:convert';
import 'package:cody/common%20wedgit/custtom_search_text_feild.dart';
import 'package:cody/common%20wedgit/doonload_wedgit.dart';
import 'package:cody/common%20wedgit/failed_wedgit.dart';
import 'package:cody/features/chat/presintation/views%20bloc/chat_bloc.dart';
import 'package:cody/features/chat/presintation/views%20bloc/get%20mesages%20bloc/get_messages_bloc.dart';
import 'package:cody/features/chat/presintation/views/wedgits/add_new_project_form.dart';
import 'package:cody/features/chat/presintation/views/wedgits/add_to_an_exested_project_message.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import '../../../../common wedgit/custtom_textfield.dart';
import '../../../../common wedgit/drop_down_list.dart';
import '../../../../common wedgit/servies_locator.dart';
import '../../../../common wedgit/show_dialoge_messeage.dart';
import '../../../../constants/colo_extension.dart';
import '../../../../constants/names.dart';
import '../../../../constants/styles.dart';
import '../../../home/home_page.dart';
import '../../../home/wedgits/custtom_app_aseet_image.dart';
import '../../../projects/data/repo/code_repo_impl.dart';
import '../../../projects/presintation/views bloc/code bloc/code_bloc.dart';
import '../../data/models/index_chat_model.dart';
import '../views bloc/create session/create_session_bloc.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CreateSessionBloc>(context).add(CreateSessionEvent('session'));
 //   BlocProvider.of<GetMessagesBloc>(context).add(indexEvent());
  }
 late IndexChatModel indexChatModel;
  final TextEditingController _controller = TextEditingController();
  late String mess;
  static GlobalKey<FormState> completeKey = GlobalKey();
  final List<TextEditingController> textControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  // Future<void> _sendMessage(String message) async {
  //   setState(() {
  //     _messages.add({'user': message});
  //     _messages.add({'bot': message});
  //   });
  //   _controller.clear();
  //
  //   final response = await http.post(
  //     Uri.parse('https://api.openai.com/v1/completions'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       // 'Authorization': 'Bearer $openAIAPIKey',
  //     },
  //     body: jsonEncode({
  //       'prompt': message,
  //       'max_tokens': 150,
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     final reply = data['choices'][0]['text'].trim();
  //     setState(() {
  //       _messages.add({'bot': reply});
  //     });
  //   } else {
  //     print('Failed to get response: ${response.statusCode}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CreateSessionBloc, CreateSessionState>(
          builder: (context, state) {
            if (state is CreateCreateSessionSuccess) {
              return ChatSessionSuccessBody(context,state.showAllPagesModel.data!.id!);
            }
            if (state is CreateSessionFailed) {
              return FailedWedgit();
            }
            return DoonloadWedgit();
          },
        ),
      ),
    );
  }

  Column ChatSessionSuccessBody(BuildContext context ,int ChatSessionId) {
    return Column(
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
        // BlocConsumer<GetMessagesBloc, GetMessagesState>(builder: (context, getState) {
        //   if(getState is GetChatSuccess) {
        //     ListView.builder(itemBuilder: (context, index) {
        //       return Column(children: [
        //         Text('Session ${index}'),
        //         BlocBuilder<ChatBloc, ChatState>(
        //           builder: (context, state) {
        //             return Expanded(
        //               child: ListView.builder(
        //                 itemCount:state.messages.length,
        //                 // _messages.length,
        //                 itemBuilder: (context, index) {
        //                   final message =getState.showAllPagesModel.data!.messages![index].text ;
        //                  // message.add(state.messages)
        //                   final isUserMessage = message!.split(':').first == ('You');
        //                   return Column(
        //                     children: [
        //                       Align(
        //                         alignment: isUserMessage
        //                             ? Alignment.centerRight
        //                             : Alignment.centerLeft,
        //                         child: Container(
        //                           padding: EdgeInsets.all(10),
        //                           decoration: BoxDecoration(
        //                               color: isUserMessage
        //                                   ? TColor.secondaryColor2
        //                                   : TColor.white,
        //                               borderRadius: BorderRadius.circular(12),
        //                               border: Border.all(
        //                                   width: 1, color: TColor.blueColor)),
        //                           child: Text(isUserMessage
        //                               ? state.messages[index]
        //                               : state.messages[index]),
        //                         ),
        //                       ),
        //                       isUserMessage ? SizedBox():Row(
        //                         mainAxisAlignment: MainAxisAlignment.end,
        //                         children: [
        //                           IconButton(
        //                               padding: EdgeInsets.zero,
        //                               onPressed: () {
        //                                 showErrorDialogMesseage(
        //                                   context1: context,
        //                                   ontaptry: () {},
        //                                   ontapcancel: () {
        //                                     GoRouter.of(context).pop();
        //                                   },
        //                                   buttonText: 'add',
        //                                   widget: AddToAnExextedProjectMessage(),
        //                                 );
        //                               },
        //                               icon: Icon(
        //                                   Icons.dashboard_customize_rounded)),
        //                           IconButton(
        //                               onPressed: () {
        //                                 GoRouter.of(context).pushNamed(Names.AddNewProjectForm);
        //                               },
        //                               icon: Icon(
        //                                   Icons.dashboard_customize_outlined))
        //                         ],
        //                       )
        //
        //                     ],
        //                   );
        //                 },
        //               ),
        //             );
        //           },
        //         )
        //       ],);
        //     },itemCount: indexChatModel.data!.length,);
        //   }
        //   return SizedBox() ;
        // }, listener: (context, state) {
        //   if(state is IndexChatSuccess)
        //     {
        //      indexChatModel = state.showAllPagesModel;
        //     }
        // },),
        BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount:state.messages.length,
                  // _messages.length,
                  itemBuilder: (context, index) {
                      mess = state.messages[index].toString() ;
                    // message.add(state.messages)
                    final isUserMessage = mess.split(':').first == ('You');
                    return Column(
                      children: [
                        Align(
                          alignment: isUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isUserMessage
                                    ? TColor.secondaryColor2
                                    : TColor.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    width: 1, color: TColor.blueColor)),
                            child: Text(isUserMessage
                                ? state.messages[index]
                                : state.messages[index]),
                          ),
                        ),
                        isUserMessage ? SizedBox():Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {

                                  GoRouter.of(context).pushNamed(Names.AddToAnExextedProjectMessage,extra:"${mess}");
                                },
                                icon: Icon(
                                    Icons.dashboard_customize_rounded)),
                            IconButton(
                                onPressed: () {
                                GoRouter.of(context).pushNamed(Names.AddNewProjectForm, extra:"${mess}");
                                },
                                icon: Icon(
                                    Icons.dashboard_customize_outlined))
                          ],
                        )

                      ],
                    );
                  },
                ),
              ),
            );
          },
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
                      //_sendMessage(_controller.text);
                    }
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (_controller.text.isNotEmpty) {
                  context.read<ChatBloc>().add(SendChat(_controller.text,ChatSessionId,_controller.text));
                  _controller.clear();
                 // _sendMessage(_controller.text);
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
    );
  }
}
// (state is getChatForChatEvent)? Expanded(
//     child: ListView.builder(
//       itemCount:state.showAllPagesModel.data!.length,
//       // _messages.length,
//       itemBuilder: (context, index) {
//         final message = state.showAllPagesModel.data!.;
//         final isUserMessage = message.split(':').first == ('You');
//         return Column(
//           children: [
//             Align(
//               alignment: isUserMessage
//                   ? Alignment.centerRight
//                   : Alignment.centerLeft,
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: isUserMessage
//                         ? TColor.secondaryColor2
//                         : TColor.white,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                         width: 1, color: TColor.blueColor)),
//                 child: Text(isUserMessage
//                     ? state.messages[index]
//                     : state.messages[index]),
//               ),
//             ),
//             isUserMessage ? SizedBox():Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                     padding: EdgeInsets.zero,
//                     onPressed: () {
//                       showErrorDialogMesseage(
//                         context1: context,
//                         ontaptry: () {},
//                         ontapcancel: () {
//                           GoRouter.of(context).pop();
//                         },
//                         buttonText: 'add',
//                         widget: AddToAnExextedProjectMessage(),
//                       );
//                     },
//                     icon: Icon(
//                         Icons.dashboard_customize_rounded)),
//                 IconButton(
//                     onPressed: () {
//                       GoRouter.of(context).pushNamed(Names.AddNewProjectForm);
//                     },
//                     icon: Icon(
//                         Icons.dashboard_customize_outlined))
//               ],
//             )
//
//           ],
//         );
//       },
//     ),
//   ):SizedBox(),