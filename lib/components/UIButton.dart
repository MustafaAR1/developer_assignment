import 'package:developer_assignment/constants/color_constants.dart';
import 'package:flutter/material.dart';

class UIButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final IconData? prefixIcon;
  final String? imageIcon;

  const UIButton({
    super.key,
    this.text,
    this.onPressed,
    this.buttonColor = Colors.white,
    this.textColor = ColorConstants.darkBlue,
    this.prefixIcon,
    this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: const Size.fromHeight(40),
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            Icon(prefixIcon, color: textColor),
            const SizedBox(width: 8),
          ],
          if (imageIcon != null) ...[
            Image.asset(imageIcon!, height: 20, width: 20),
          ],
          if (text != null)
            Text(
              text!,
              style: TextStyle(fontSize: 16, color: textColor),
            ),
        ],
      ),
    );
  }
}
