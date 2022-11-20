import 'package:flutter/material.dart';

enum CustomTextFieldType {
  regular,
  email,
  number,
  password,
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    this.textFieldType = CustomTextFieldType.regular,
  }) : super(key: key);

  final String hint;
  final CustomTextFieldType textFieldType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true; // * Only applies to password type text field

  TextInputType getKeyboardType(CustomTextFieldType textFieldType) {
    switch (textFieldType) {
      case CustomTextFieldType.regular:
        return TextInputType.text;
      case CustomTextFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFieldType.number:
        return TextInputType.number;
      case CustomTextFieldType.password:
        return TextInputType.text;
      default:
        return TextInputType.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: getKeyboardType(widget.textFieldType),
      style: const TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w600,
        fontFamily: 'RHD',
        fontSize: 16,
      ),
      obscureText: widget.textFieldType == CustomTextFieldType.password
          ? _obscure
          : false,
      decoration: InputDecoration(
        suffixIcon: widget.textFieldType == CustomTextFieldType.password
            ? Container(
                margin: const EdgeInsets.only(right: 22),
                child: GestureDetector(
                  child: _obscure
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onTap: () => setState(() => _obscure = !_obscure),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        fillColor: const Color(0xFFEEEEEE),
        filled: true,
        contentPadding: const EdgeInsets.all(22),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontFamily: 'RHD',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
