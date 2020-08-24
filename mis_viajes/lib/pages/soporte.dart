import 'package:flutter/material.dart';

// ignore: camel_case_types
class soporte extends StatefulWidget {
  static const String ruta = "/soporte";

  @override
  _soporteState createState() => _soporteState();
}

class _soporteState extends State<soporte> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChartMessage> _messaje = <ChartMessage>[];
  bool _isTyped = false;
  void _handleSubmit(String text) {
    _textController.clear();
    setState(() {
      _isTyped = false;
    });
    ChartMessage message = ChartMessage(
      text: text,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
      ),
      name: "Andres",
    );

    setState(() {
      _messaje.insert(0, message);
    });
    message.animationController.forward();

    print(text);
  }

  Widget _buildTextComposer(BuildContext context) {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isTyped = text.length > 0;
                  });
                },
              ),
            ),
            Container(
                child: IconButton(
              icon: Icon(Icons.send),
              onPressed:
                  _isTyped ? () => _handleSubmit(_textController.text) : null,
            ))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soporte',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Colors.black),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            padding: const EdgeInsets.all(8.0),    
            reverse: true,
            itemBuilder: (_, int index) => _messaje[index],
            itemCount: _messaje.length,
          )),
          Divider(height: 1.0),
          Container(
            child: _buildTextComposer(context),
          )
        ],
      )),
    );
  }
}

class ChartMessage extends StatelessWidget {
  ChartMessage({this.text, this.animationController, this.name});
  final String text;
  final AnimationController animationController;
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text(name[0]),
                  ),
                ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(text),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
