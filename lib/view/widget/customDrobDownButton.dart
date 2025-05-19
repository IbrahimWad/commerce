import 'package:ecommerce/constant.dart';
import 'package:ecommerce/view/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class CustomDropDwonButton extends StatelessWidget {
  CustomDropDwonButton(
      {super.key,
      required this.hint,
      required this.items,
      required this.onChanged,
      required this.selectedValue});
  final String hint;
  var items;
  var onChanged;
  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FormBuilderDropdown(
            elevation: 2,
            decoration: InputDecoration(
                filled: true,
                fillColor: primaryColor,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                )),
            onChanged: onChanged,
            hint: CusomText(
              text: hint,
            ),
            items: [
              'Accessories',
              'Computers',
              'Electronics',
              'Laptops',
              'Mobile',
              'Storage',
            ]
                .map((gender) => DropdownMenuItem(
                    // alignment: AlignmentDirectional.topStart,
                    value: gender,
                    alignment: AlignmentDirectional.center,
                    child: CusomText(
                      text: gender,
                      fontWeight: FontWeight.normal,
                      alignment: Alignment.topRight,
                    )))
                .toList(),
            name: 'Category'));
  }
}
