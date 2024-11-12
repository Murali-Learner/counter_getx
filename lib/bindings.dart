import 'package:counter_getx/counter_controller.dart';
import 'package:counter_getx/search.dart';
import 'package:counter_getx/sec_controller.dart';
import 'package:get/instance_manager.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchControllerC());
    Get.put(CounterController());
    Get.put(SecCounterController());
  }
}
