import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool isPassword;
  final bool readOnly;
  final bool enabled;

  final int maxLines;
  final int? maxLength;

  final TextInputType keyboardType;

  final String? Function(String?)? validator;

  final ValueChanged<String>? onChanged;

  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onTap,
  });

  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState
    extends State<CustomTextField> {

  late bool obscureText;

  @override
  void initState() {
    super.initState();

    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {

    return Padding(

      padding:
          const EdgeInsets.symmetric(
        vertical: 8,
      ),

      child: TextFormField(

        controller: widget.controller,

        keyboardType:
            widget.keyboardType,

        obscureText: obscureText,

        readOnly: widget.readOnly,

        enabled: widget.enabled,

        maxLines:
            widget.isPassword
                ? 1
                : widget.maxLines,

        maxLength: widget.maxLength,

        validator: widget.validator,

        onChanged: widget.onChanged,

        onTap: widget.onTap,

        decoration: InputDecoration(

          labelText: widget.label,

          hintText: widget.hintText,

          border:
              OutlineInputBorder(

            borderRadius:
                BorderRadius.circular(
              12,
            ),

          ),

          enabledBorder:
              OutlineInputBorder(

            borderRadius:
                BorderRadius.circular(
              12,
            ),

          ),

          focusedBorder:
              OutlineInputBorder(

            borderRadius:
                BorderRadius.circular(
              12,
            ),

            borderSide:
                const BorderSide(
              width: 2,
            ),

          ),

          prefixIcon:
              widget.prefixIcon == null

                  ? null

                  : Icon(
                      widget.prefixIcon,
                    ),

          suffixIcon: widget.isPassword

              ? IconButton(

                  icon: Icon(

                    obscureText

                        ? Icons.visibility

                        : Icons
                            .visibility_off,

                  ),

                  onPressed: () {

                    setState(() {

                      obscureText =
                          !obscureText;

                    });

                  },

                )

              : widget.suffixIcon == null

                  ? null

                  : Icon(
                      widget.suffixIcon,
                    ),

        ),

      ),

    );

  }

}