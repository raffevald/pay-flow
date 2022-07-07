import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  final TextStyle? style;

  const LabelButton(
      {Key? key, required this.label, required this.onPressed, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: style ?? TextStyles.buttonHeading,
        ),
      ),
    );
  }
}
