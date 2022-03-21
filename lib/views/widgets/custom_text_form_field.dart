import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hintText;
  final void Function(String?)? onSaved;

  const CustomTextFormField({
    Key? key,
    this.text,
    this.hintText,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text!,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black),
            fillColor: Colors.white,
          ),
          validator: (String? value) =>
              value!.isEmpty ? "$text can not be empty" : null,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
