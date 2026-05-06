import 'package:get/get.dart';
import 'package:pocket_hisab/models/person_model.dart';
import 'package:pocket_hisab/services/database_service.dart';

class PersonController extends GetxController {
  final _db = DatabaseService();
  static const _table = 'persons';

  final RxList<PersonModel> persons = <PersonModel>[].obs;
  final RxBool isLoading = false.obs;

  final RxDouble netBalance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAll();
  }

  Future<void> fetchAll()async{
    isLoading(true);
    final rows = await _db.getAll(_table);
    persons.value = rows.map(PersonModel.fromMap).toList();
    isLoading(false);
  }

  Future<bool> addPerson(PersonModel person) async {
    try{
      final id = await _db.insert(_table, person.toMap());
      persons.insert(0, person.copyWith(id: id));
      return true;
    }catch (_){
      return false;
    }
  }


}