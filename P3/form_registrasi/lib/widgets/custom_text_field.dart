import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;

  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  ////////////////////////////////////////////////////////////////////////////////////////
  final bool readOnly;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;


  ////////////////////////////////////////////////////////////////////////////////////////

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,

    ///////////////////////////////////////////////////////////////////////////////////
    this.readOnly = false,
    this.onTap,
    this.onChanged,

    /////////////////////////////////////////////////////////////////////////////////////


    this.hint,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        ///////////////////////////////////////////////////////////////////////////////////
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        ///////////////////////////////////////////////////////////////////////////////////
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,

        
        
      ),
    );
  }
}
