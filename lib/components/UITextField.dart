import 'package:flutter/material.dart';

class UiTextField extends StatelessWidget {
  final String title;
  final String labelText;
  final bool isPassword;
  final bool showPrefixIcon;

  final bool isVisible;
  final Function()? onVisibilityToggle;

  const UiTextField(
      {super.key,
      required this.title,
      required this.labelText,
      this.isPassword = false,
      this.isVisible = true,
      this.onVisibilityToggle,
      this.showPrefixIcon = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            // fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isVisible,
          decoration: InputDecoration(
            isDense: true,
            hintText: labelText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            suffixIcon: showPrefixIcon
                ? IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      size: 16,
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
