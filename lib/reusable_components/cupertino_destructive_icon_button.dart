import 'package:flutter/cupertino.dart';
import './cupertino_icon_button.dart';

class DestructiveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  
  const DestructiveButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoIconButton(
      icon: CupertinoIcons.trash,
      color: CupertinoColors.destructiveRed,
      textColor: CupertinoColors.secondarySystemBackground,
      onPressed: onPressed,
    );
  }
}