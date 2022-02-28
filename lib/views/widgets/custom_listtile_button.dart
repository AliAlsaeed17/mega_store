import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomListTileButton extends StatelessWidget {
  const CustomListTileButton(
      {Key? key,
      required this.text,
      required this.leading,
      this.trailing = Icons.navigate_next,
      required this.onTap})
      : super(key: key);

  final String text;
  final IconData leading;
  final IconData trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: CustomText(
            text: text,
            alignment: Alignment.centerLeft,
          ),
          leading: Icon(
            leading,
          ),
          trailing: Icon(
            trailing,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
