import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  TextComposer(this.sendMessage);

 final Function({String text, File imageFile}) sendMessage;

  @override
  _TextComposeState createState() => _TextComposeState();
}

class _TextComposeState extends State<TextComposer> {
  bool _isComposing = false;
  final TextEditingController _controller = new TextEditingController();

  void _reset() {
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera),
            onPressed: () async {
             final File imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
             if (imageFile == null) return;
             widget.sendMessage(imageFile: imageFile);
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  InputDecoration.collapsed(hintText: 'Digitem uma mensagem...'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    widget.sendMessage(text: _controller.text);
                    _reset();
                  }
                : null,
          )
        ],
      ),
    );
  }
}
