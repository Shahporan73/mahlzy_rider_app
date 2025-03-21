
import 'package:intl/intl.dart';
import 'package:mahlzy_rider_app/res/app_constant/import_list.dart';

class DatePickerController extends GetxController {
  final TextEditingController dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 100);
    DateTime lastDate = DateTime(now.year - 12); // Minimum age is 18 years

    DateTime initialDate = now.isAfter(lastDate) ? lastDate : now;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:AppColors.mainColor,
            colorScheme: ColorScheme.light(primary: AppColors.mainColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      dateController.text = formattedDate;
      update(); // Update UI
    }
  }
}
