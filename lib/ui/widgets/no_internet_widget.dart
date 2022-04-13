import 'package:flutter/material.dart';
import '../app_theme.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: AppTheme.brbaDarkGrey,
              ),
            ),
            Image.asset('assets/images/no_internet.png'),
          ],
        ),
      ),
    );
  }
}
