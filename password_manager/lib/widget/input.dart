import 'package:flutter/material.dart';
import 'package:password_manager/util/color.dart';

class InputForm extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData? icon;
  const InputForm({
    Key? key,
    required this.label,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: widget.isPassword ? !_passwordVisible : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.label,
        prefixIcon: Icon(
          widget.icon,
          color: secondaryColor,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: lightColor,
            width: 3,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: lightColor,
            width: 3,
          ),
        ),
      ),
    );
  }
}
