import 'package:akan_mobile/Globals/widgets/my_snackbar.dart';
import 'package:get/get.dart';

class AdvertController extends GetxController {
  onDonorOlButtonPressed() {
    Get.back();
    successSnackBar('Başarılı', 'Başarı ile donör olma talebiniz iletildi!');
  }
}
