import 'package:flutter/material.dart';

class FormTitleWidget extends StatelessWidget {
  const FormTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}