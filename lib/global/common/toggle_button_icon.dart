import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  final bool isEnabled;
  final VoidCallback onPressed;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    final VoidCallback? onPressed = widget.isEnabled
        ? () {
            setState(() {
              selected = !selected;
            });
            widget.onPressed();
          }
        : null;

    return IconButton(
      isSelected: selected,
      icon: const Icon(Icons.remove_red_eye),
      selectedIcon: const Icon(Icons.remove_red_eye_outlined),
      onPressed: onPressed,
    );
  }
}
