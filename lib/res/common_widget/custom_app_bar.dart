// ignore_for_file: prefer_const_constructors

import '../app_constant/import_list.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool forceMaterialTransparency;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? titleColor;
  final Color? leadingColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.fontSize,
    this.centerTitle = true,
    this.backgroundColor = Colors.white,
    this.forceMaterialTransparency = true,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading,
    this.titleColor,
    this.leadingColor,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // forceMaterialTransparency: true,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: GoogleFonts.urbanist(
            fontSize: fontSize ?? 18,
            fontWeight: FontWeight.w500,
            color: titleColor ?? Colors.black
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading ??
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.zero,
              /*width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle
              ),*/
              child: Icon(Icons.arrow_back_ios, color: leadingColor ?? AppColors.black, size: 22),
            ),
          ),
      elevation: forceMaterialTransparency ? 0 : null,
    );
  }
}
