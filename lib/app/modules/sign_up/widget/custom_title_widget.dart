import '../../../../res/app_constant/import_list.dart';

class CustomTitleWidget extends StatelessWidget {
  final String title;
  final String title2;
  final Color? title2Color;
  final bool? isEmpty;
  const CustomTitleWidget({super.key, required this.title,
    required this.title2,
    this.title2Color=AppColors.mainColor,
    this.isEmpty=false
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.jua(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
          isEmpty==false? const TextSpan(text: '') : TextSpan(
            text: title2,
            style: GoogleFonts.jua(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: title2Color,
            ),
          ),
        ],
      ),
    );
  }
}
