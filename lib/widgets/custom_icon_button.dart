import 'package:flutter/material.dart';
import 'package:mega_store/widgets/custom_text.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade50,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(imagePath),
            SizedBox(width: 90),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
