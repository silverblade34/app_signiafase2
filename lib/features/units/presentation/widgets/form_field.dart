import 'package:app_signiafase2/config/constants/fonts.dart';
import 'package:flutter/material.dart';

class FormFieldSalida extends StatelessWidget {
  final TextEditingController value;
  final String label;

  const FormFieldSalida({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: AppFonts.labelForm,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: value,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            filled: true,
          ),
        ),
      ],
    );
  }
}
