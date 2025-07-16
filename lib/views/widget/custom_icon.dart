import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onpressed});
  final IconData icon;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(onPressed: onpressed, icon: Icon(icon, size: 28)),
    );
  }
}
