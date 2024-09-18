import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => SignUpUseCase(Get.find<AuthenticationRepositoryIml>()));
    // Get.put(AuthController(Get.find()), permanent: true);
  }
}
