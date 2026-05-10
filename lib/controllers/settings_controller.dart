import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final RxDouble maxSavingLimit = 10000.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    maxSavingLimit.value = prefs.getDouble('maxSavingLimit') ?? 10000.0;
  }

  Future<void> setMaxSavingLimit(double limit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('maxSavingLimit', limit);
    maxSavingLimit.value = limit;
  }
}
