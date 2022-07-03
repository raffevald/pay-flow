import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import '../dividar_vertical/dividar_vertical_widget.dart';
import '../label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;

  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;

  final bool enablePrymaryColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      this.enablePrymaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
              style: enablePrymaryColor ? TextStyles.buttonPrimary : null,
            ),
          ),
          const DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
            ),
          ),
        ],
      ),
    );
  }
}
