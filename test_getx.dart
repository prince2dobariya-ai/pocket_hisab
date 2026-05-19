import 'package:get/get.dart';

void main() {
  final persons = <String>[].obs;
  print("Initial: ${persons.length}");
  persons.value = ["A", "B"];
  print("After first assign: ${persons.length}");
  persons.value = ["C", "D"];
  print("After second assign: ${persons.length}");
  
  persons.assignAll(["E", "F"]);
  print("After assignAll: ${persons.length}");
}
