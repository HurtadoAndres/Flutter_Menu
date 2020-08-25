import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_bloc.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_event.dart';
import 'package:mis_viajes/bloc/bloc_bloc/chat_state.dart';
import 'package:mis_viajes/data/models/chat.dart';


// ignore: camel_case_types
class ChatInfo extends StatefulWidget {


  @override
  _ChatInfoState createState() => _ChatInfoState();
}

// ignore: camel_case_types
class _ChatInfoState extends State<ChatInfo> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  List<Chat> chatList = [];
  bool _isTyped = false;

  void _handleSubmit(String txt)  async {
    _textController.clear();
    setState(() {
      _isTyped = false;
    });
    BlocProvider.of<ChatBloc>(context).add(AddChats(txt, "Andres Hurtado"));

  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          child: Row(children: <Widget>[
            Flexible(
                child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.grey[300],
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isTyped = text.length > 0;
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: "Enviar mensaje"),
              ),
            )),
            Container(
                child: IconButton(
              icon: Icon(Icons.send),
              onPressed: _isTyped ? () => _handleSubmit(_textController.text): null,
            ))
          ]),
        ));
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'soporte',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatLoaded) {
            chatList = state.chats;
            return Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: chatList.length == 0
                      ? Center(
                          child: Text("No Info Avaliable"),
                        )
                      : ListView.builder(
                          itemCount: chatList.length,
                          itemBuilder: (_, index) {
                            return ChartMessage(
                              chatList[index].mensaje,
                              chatList[index].name,
                            );
                          }),
                ),
                Divider(height: 1.0),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: _buildTextComposer(context),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget ChartMessage(String text, String name) {
  return AnimatedContainer(
    duration: Duration(microseconds: 1000),
    curve: Curves.fastOutSlowIn,
    margin: const EdgeInsets.symmetric(vertical: 10.0),
    child: Expanded(
      child: name == "Angelica"
          ? Row(
              mainAxisAlignment: name == "Angelica"
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.elasticOut,
                  padding: const EdgeInsets.only(right: 5.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(name[0]),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.elasticOut,
                        child: Text(
                          name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          text,
                        )),
                  ],
                ),
              ],
            )
          : cliente(name, text),
    ),
  );
}

Widget cliente(String name, String text) {
  return Row(
    mainAxisAlignment:
        name == "Angelica" ? MainAxisAlignment.start : MainAxisAlignment.end,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.elasticOut,
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                text,
              )),
        ],
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.elasticOut,
        padding: const EdgeInsets.only(left: 5.0),
        child: CircleAvatar(
         
          child: Text(name[0]),

        ),
      ),
    ],
  );
}
