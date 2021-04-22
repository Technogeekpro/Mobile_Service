import 'package:get/get.dart';
import 'package:mobile_service/controller/auth_controller.dart';


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuthController>(FirebaseAuthController(), permanent: true);
  }
}
