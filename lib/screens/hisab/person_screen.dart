import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pocket_hisab/constants/app_theme.dart';
import 'package:pocket_hisab/controllers/person_controller.dart';
import 'package:pocket_hisab/helpers/currency_helper.dart';
import 'package:pocket_hisab/models/person_model.dart';
import 'package:pocket_hisab/screens/hisab/person_hisab_history_screen.dart';
import 'package:pocket_hisab/widgets/custom_button.dart';
import 'package:pocket_hisab/widgets/custom_text.dart';
import 'package:pocket_hisab/widgets/custome_textform_filed.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({super.key});

  final personController = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => personController.fetchAll(),
        child: Column(
          children: [
            Container(
              margin: const .symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(222),
                borderRadius: .circular(12),
                border: .all(color: Colors.blueGrey.shade50, width: 0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(4),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: const AppText('Net Balance', color: Colors.white),
                subtitle: Row(
                  spacing: 4,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 12,
                      color: Colors.white,
                    ),
                    Obx(
                      () => AppText(
                        '${personController.persons.length} Persons',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                trailing: Obx(() {
                  double balance = personController.netBalance.value;
                  String netBalance = CurrencyHelper.format(balance.abs());
                  String balanceText = balance >= 0 ? "You get" : "You pay";
                  Color netBalanceColor = balance >= 0
                      ? Colors.green
                      : Colors.red;
                  return Column(
                    mainAxisSize: .min,
                    crossAxisAlignment: .end,
                    children: [
                      AppText(netBalance, color: netBalanceColor),
                      AppText(balanceText, color: netBalanceColor),
                    ],
                  );
                }),
              ),
            ),
            Obx(() {
              int itemCount = personController.persons.length;
              if (personController.persons.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text(
                      "No person found",
                      style: TextStyle(
                        fontWeight: .w600,
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    height: 0,
                    indent: 65,
                    endIndent: 20,
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  padding: const .only(bottom: 70),
                  itemCount: itemCount,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    PersonModel person = personController.persons[index];
                    return ListTile(
                      onTap: () => Get.to(
                        () => PersonHisabHistoryScreen(
                          personId: person.id?.toString() ?? '',
                          personName: person.personName,
                        ),
                      ),
                      title: AppText(person.personName),
                      leading: CircleAvatar(
                        child: AppText(
                          person.personName.substring(0, 1).toUpperCase(),
                          color: Colors.white,
                        ),
                      ),
                      subtitle: AppText(
                        "Added on ${DateFormat('dd MMM, yyyy').format(DateTime.parse(person.createdAt))}",
                        size: 12,
                        color: AppColors.textLight,
                      ),
                      trailing: person.balance == 0
                          ? const SizedBox()
                          : Column(
                              mainAxisSize: .min,
                              crossAxisAlignment: .end,
                              children: [
                                AppText(
                                  CurrencyHelper.format(
                                    (person.balance ?? 0).abs(),
                                  ),
                                  color: (person.balance ?? 0) > 0
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: .bold,
                                  size: 14,
                                ),
                                AppText(
                                  (person.balance ?? 0) > 0
                                      ? 'You get'
                                      : 'You pay',
                                  color: (person.balance ?? 0) > 0
                                      ? Colors.green
                                      : Colors.red,
                                  size: 14,
                                ),
                              ],
                            ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.bottomSheet(
            _AddPersonBottomSheet(),
            isScrollControlled: false,
            backgroundColor: AppColors.bottomSheet,
            shape: const RoundedRectangleBorder(
              borderRadius: .vertical(top: .circular(20)),
            ),
          );
        },
        label: AppText('+ Add Person', color: Colors.white),
      ),
    );
  }
}

class _AddPersonBottomSheet extends StatefulWidget {
  @override
  State<_AddPersonBottomSheet> createState() => _AddPersonBottomSheetState();
}

class _AddPersonBottomSheetState extends State<_AddPersonBottomSheet> {
  final _personName = TextEditingController();

  @override
  void dispose() {
    _personName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 24.0,
        bottom: MediaQuery.of(context).padding.bottom + 16.0,
      ),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              const AppText("Add Person"),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _personName,
            keyboardType: .text,
            labelText: "Person Name",
            hintText: "Enter name",
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: .infinity,
            height: 50,
            child: CustomButton(
              onTap: () {
                final personName = _personName.text.trim();
                if (personName.isEmpty) {
                  Get.snackbar('Error', 'Please enter Person name');
                  return;
                }

                final personCtrl = Get.find<PersonController>();
                personCtrl.addPerson(
                  PersonModel(
                    personName: personName,
                    createdAt: DateTime.now().toString(),
                  ),
                );
                Get.back();
              },
              title: "Add Person",
            ),
          ),
        ],
      ),
    );
  }
}
