import 'package:flutter/material.dart';
import '../../app_theme.dart';

class LinesDivider extends StatelessWidget {
  final double width;

  const LinesDivider({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Divider(
      thickness: 3,
      height: 30,
      endIndent: screenWidth - width,
      color: AppTheme.brbaOrange,
    );
  }
}
