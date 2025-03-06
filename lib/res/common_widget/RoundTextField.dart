// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_constant/import_list.dart';

class RoundTextField extends StatelessWidget {
  final String hint;
  final double? height;
  final double? vertical_padding;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color focusColor;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int? maxLine;
  final TextAlign textAlign;
  final bool readOnly;
  final TextStyle? style;
  final bool obscureText;
  final String obscuringCharacter;
  final Function(String?)? onSaved;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final bool? filled;
  final Color? hintColor;
  final Color fillColor;
  final double focusBorderRadius;
  final double focusBorderWidth;
  final String? errorText; // For manual validation
  final String? Function(String?)? validator; // Added for form validation
  final bool isBorder;
  final double? hintSize;
  const RoundTextField({
    super.key,
    required this.hint,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.focusColor = AppColors.mainColor,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.maxLine = 1,
    this.readOnly = false,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.obscuringCharacter = '•',
    this.style,
    this.onSaved,
    this.borderRadius = 8,
    this.focusBorderRadius = 8,
    this.borderColor = Colors.black,
    this.borderWidth = 1.0,
    this.filled = true,
    this.fillColor = const Color(0xffdddddd),
    this.focusBorderWidth = 1,
    this.errorText, // For validation messages
    this.validator,
    this.hintColor,
    this.height,
    this.vertical_padding,
    this.isBorder = false,
    this.hintSize=12,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height ?? (errorText == null ?
      MediaQuery.of(context).size.height / 16 : MediaQuery.of(context).size.height / 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusColor, width: focusBorderWidth),
            borderRadius: BorderRadius.circular(focusBorderRadius),
          ),
          border: OutlineInputBorder(
            borderSide: isBorder ==false?  BorderSide.none : BorderSide(width: borderWidth, color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.urbanist(
              color: hintColor ?? Color(0xff595959),
              fontWeight: FontWeight.w400,
              fontSize: hintSize ?? 12
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText, // Error message if present
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: vertical_padding ?? 0),
        ),
        onTap: onTap,
        onChanged: onChanged,
        keyboardType: keyboardType,
        maxLines: maxLine,
        textAlign: textAlign,
        readOnly: readOnly,
        style: style,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
        onSaved: onSaved,
        validator: validator, // Form validation logic
      ),
    );
  }
}