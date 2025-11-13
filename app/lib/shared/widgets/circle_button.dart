import 'package:flutter/cupertino.dart';

class CircleButton extends StatelessWidget {
  final double padding;
  final VoidCallback onPressed;
  final Widget child;

  const CircleButton({
    super.key,
    required this.padding,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}