import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpWidget extends StatelessWidget {
  final Color? pinColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final TextStyle? textStyle;
  final String? hintText;
  final double? borderRadius;
  final double? fieldHeight;
  final double? fieldWidth;
  final int? numberOfFields;

  CustomOtpWidget({
    super.key,
    this.pinColor,
    this.borderColor,
    this.focusedBorderColor,
    this.textStyle,
    this.hintText,
    this.borderRadius,
    this.fieldHeight,
    this.fieldWidth,
    this.numberOfFields = 4, // Default 4 OTP fields
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      hintText: hintText ?? "0",
      hintStyle: TextStyle(color: const Color(0xFF757575)),
      border: authOutlineInputBorder(borderColor ?? Colors.white, borderRadius ?? 12.0),
      enabledBorder: authOutlineInputBorder(borderColor ?? Colors.white, borderRadius ?? 12.0),
      focusedBorder: authOutlineInputBorder(
        focusedBorderColor ?? const Color(0xFFFF7643),
        borderRadius ?? 12.0,
      ),
    );

    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(numberOfFields!, (index) {
              return SizedBox(
                height: fieldHeight ?? 64,
                width: fieldWidth ?? 64,
                child: TextFormField(
                  onSaved: (pin) {},
                  onChanged: (pin) {
                    if (pin.isNotEmpty) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: textStyle ?? Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                  decoration: inputDecoration,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

OutlineInputBorder authOutlineInputBorder(Color color, double borderRadius) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  );
}
