import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05)),
      child: IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 28)),
    );
  }
}
