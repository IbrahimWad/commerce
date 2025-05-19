// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormFild extends StatelessWidget {
  final String text;
  final String hint;
  var onsave;
  var validator;
  CustomTextFormFild({
    Key? key,
    required this.text,
    required this.hint,
    this.onsave,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CusomText(
            text: text,
            fontSize: 14,
            color: Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: validator,
            onSaved: onsave,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              fillColor: Colors.white30,
            ),
          )
        ],
      ),
    );
  }
}
