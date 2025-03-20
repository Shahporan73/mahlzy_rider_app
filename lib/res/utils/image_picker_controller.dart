// image_picker_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  Future<void> profilePickImage(ImageSource source) async {
    await pickImage(source);
  }
}
