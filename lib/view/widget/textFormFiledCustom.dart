import 'package:flutter/material.dart';

class TextFormFiledCustom extends StatelessWidget {
  TextFormFiledCustom(
      {required this.hint,
      required this.textEditingController,
      super.key,
      this.keybordType = TextInputType.text,
      this.maxLines = 1,
      this.color = Colors.white});
  var textEditingController;
  final String hint;
  final int maxLines;
  final Color color;
  var keybordType;
//keyboardType: keybordType
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: keybordType,
        maxLines: maxLines,
        cursorColor: Colors.white70,
        controller: textEditingController,
        decoration: InputDecoration(
          focusColor: Colors.black,
          hintText: hint,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color)),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: color),
          ),
          enabled: true,
          //  cursorColor: Colors.transparent,
        ),
      ),
    );
  }
}
