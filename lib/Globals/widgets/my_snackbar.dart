import 'package:akan_mobile/Globals/constans/colors.dart';
import 'package:get/get.dart';

errorSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorDanger.withOpacity(0.7),
    colorText: colorWhite,
  );
}

warningSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorWarning.withOpacity(0.7),
    colorText: colorWhite,
  );
}

infoSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorInfo.withOpacity(0.7),
    colorText: colorWhite,
  );
}

successSnackBar(String title, String content) {
  return Get.snackbar(
    title,
    content,
    backgroundColor: colorSuccess.withOpacity(0.7),
    colorText: colorWhite,
  );
}
