import 'package:flutter/material.dart';

enum ButtonType { filled, outlined }

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final String? title;
  final Widget? icon;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonType,
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.filled) {
      return TextButton(onPressed: onPressed, child: _child());
    } else if (buttonType == ButtonType.outlined) {
      return OutlinedButton(onPressed: onPressed, child: _child());
    }
    return Placeholder();
  }

  Widget _child() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Padding(padding: const EdgeInsets.only(left: 5), child: icon!),
        if (title?.isNotEmpty ?? false) Text(title!),
      ],
    );
  }
}
