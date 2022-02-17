import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final String imagePath;
  final void Function() onPressed;

  const CustomIconButton(
      {Key? key,
      required this.text,
      required this.imagePath,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        //color: Colors.grey.shade50,
      ),
      child: FlatButton(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imagePath),
            SizedBox(width: 45),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
