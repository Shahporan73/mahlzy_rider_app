// ignore_for_file: prefer_const_constructors


import '../app_constant/import_list.dart';

class CustomRadioButton extends StatelessWidget {
  final List<String> options;
  final String selectedValue;
  final ValueChanged<String> onChanged;
  final Color selectedColor;

  CustomRadioButton({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.selectedColor = AppColors.mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: options.map((option) {
          return Row(
            children: [
              Radio<String>(
                value: option,
                // fillColor: MaterialStateProperty.all(AppColors.primaryColor),
                groupValue: selectedValue,
                onChanged: (value) {
                  if (value != null) {
                    onChanged(value);
                  }
                },
                activeColor: selectedColor,
              ),
              Text(
                option,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              if (option != options.last) SizedBox(width: 20),
            ],
          );
        }).toList(),
      ),
    );
  }
}
