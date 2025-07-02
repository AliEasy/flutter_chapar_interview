import 'package:flutter/material.dart';

enum ButtonType { filled, outlined }

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonType buttonType;
  final String? title;
  final Widget? icon;
  final bool isLoading;

  const ButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonType,
    this.title,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.filled) {
      return ElevatedButton(onPressed: onPressed, child: _child());
    } else if (buttonType == ButtonType.outlined) {
      return OutlinedButton(onPressed: onPressed, child: _child());
    }
    return const Placeholder();
  }

  Widget _child() {
    if (!isLoading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(padding: const EdgeInsets.only(left: 5), child: icon!),
          if (title?.isNotEmpty ?? false) Text(title!),
        ],
      );
    } else {
      return const SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
