import 'package:chatflutter/chat/model/chat_model.dart';
import 'package:chatflutter/chat/model/message_model.dart';
import 'package:chatflutter/user/model/user_model.dart';
import 'package:chatflutter/common/provider/isdarkmode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// bool isDarkMode = true;
String isMe = '1';

class ChatScreen extends ConsumerStatefulWidget {
  static String get routeName => 'chat';

  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();

  late UserModel user;
  late ChatModel chat;
  late String text;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ]),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chats',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).changeMode();
              },
              icon: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                // const _ChatMessages(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: scrollController,
                    reverse: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: (isMe == '1')
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.66,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (isMe == '1')
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.secondary,
                          ),
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            "aaaaaa",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextFormField(
                  controller: textEditingController,
                  onChanged: (value) {
                    // setState(() {
                    //   text = value;
                    //   print(text);
                    // })
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withAlpha(150),
                      hintText: 'Type here ...',
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      suffixIcon: IconButton(
                        onPressed: () {
                          MessageModel message = MessageModel(
                            senderId: '1',
                            recipientId: '1',
                            text: text,
                            createdAt: DateTime.now(),
                          );

                          List<MessageModel> messages = List.from(chat.messages)
                            ..add(message);

                          messages.sort(
                              (a, b) => b.createdAt.compareTo(a.createdAt));

                          // setState(() {
                          //   chat = chat.copyWith(messages: messages);
                          // });

                          scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          );

                          textEditingController.clear();
                        },
                        icon: const Icon(Icons.send),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class _ChatMessages extends ConsumerWidget {
//   const _ChatMessages({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Expanded(
//       child: ListView.builder(
//         shrinkWrap: true,
//         reverse: true,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Align(
//             alignment:
//                 (isMe == '1') ? Alignment.centerLeft : Alignment.centerRight,
//             child: Container(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.66,
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: (isMe == '1')
//                     ? Theme.of(context).colorScheme.primary
//                     : Theme.of(context).colorScheme.secondary,
//               ),
//               padding: const EdgeInsets.all(10.0),
//               margin: const EdgeInsets.symmetric(vertical: 5.0),
//               child: Text(
//                 "aaaaaa",
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
