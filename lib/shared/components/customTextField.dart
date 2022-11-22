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
    this.controller,
    this.autoFocus = false,
    this.node,
    this.nextNode,
    this.onFieldSubmitted,
    this.validator,
    this.hasError = false,
    this.errorMessage,
    this.enabled = true,
    this.textInputAction,
  }) : super(key: key);

  final String hint;
  final CustomTextFieldType textFieldType;
  final TextEditingController? controller;
  final bool autoFocus;
  final FocusNode? node;
  final FocusNode? nextNode;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool hasError;
  final bool enabled;
  final String? errorMessage;
  final TextInputAction? textInputAction;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscure = true; // * Only applies to password type text field

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: widget.validator,
          onFieldSubmitted: widget.onFieldSubmitted ??
              (value) {
                if (widget.node != null) {
                  widget.node!.unfocus();
                  FocusScope.of(context).requestFocus(widget.nextNode);
                }
              },
          autofocus: widget.autoFocus,
          enabled: widget.enabled,
          focusNode: widget.node,
          controller: widget.controller,
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
            errorText: widget.errorMessage,
            hintStyle: const TextStyle(
              color: Colors.black54,
              fontFamily: 'RHD',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        // if ((widget.errorMessage ?? '').isNotEmpty)
        //   Padding(
        //     padding: const EdgeInsets.only(left: 8.0, top: 5),
        //     child: Text(
        //       widget.errorMessage!,
        //       style: TextStyle(
        //         color: Colors.red.shade500,
        //         fontFamily: 'Metro',
        //         fontWeight: FontWeight.w600,
        //         fontSize: 10,
        //       ),
        //     ),
        //   ),
      ],
    );
  }

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
}
