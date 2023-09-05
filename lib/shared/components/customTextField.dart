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
          style: TextStyle(
            color: Theme.of(context).textTheme.displayMedium?.color,
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
            fillColor: Theme.of(context).cardColor,
            filled: true,
            contentPadding: const EdgeInsets.all(22),
            hintText: widget.hint,
            errorText: widget.errorMessage,
            hintStyle: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.color
                  ?.withOpacity(.7),
              fontFamily: 'RHD',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
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
