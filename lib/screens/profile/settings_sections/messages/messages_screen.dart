import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:water/models/message.dart';
import 'package:water/screens/profile/settings_sections/messages/message_widget.dart';

class MessagesScreen extends StatefulWidget {
  static const String routeName = 'MessagesScreen';

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.support,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SizedBox(
                child: MessageWidget(Message(
                    content: ' مرحباً هل يمكنني الاستعلام عن طلبي؟',
                    id: '123',
                    senderId: '123',
                    timestamp: 123456)),
              )),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      color: Color(0xff528485),
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Icon(Icons.send,
                            textDirection: TextDirection.ltr,
                            size: 24,
                            color: Colors.white)),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: messageController,
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          hintText:
                              AppLocalizations.of(context)!.message_screen_hint,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                              ),
                              borderSide: BorderSide()),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                              ),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.blueAccent))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
