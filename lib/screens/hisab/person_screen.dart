// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pocket_hisab/constants/colors.dart';
// import 'package:pocket_hisab/controllers/hisab_controller.dart';
//
// class PersonScreen extends StatelessWidget {
//   PersonScreen({super.key});
//
//   final hisabController = Get.put(HisabController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     body: RefreshIndicator(
//         onRefresh: () => hisabController.fetchPersons(),
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.symmetric(
//                 horizontal: 12,
//               ).copyWith(top: 16),
//               decoration: BoxDecoration(
//                 color: colorPrimary.withAlpha(30),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: ListTile(
//                 title: const Text('Net Balance'),
//                 subtitle: Row(
//                   spacing: 4,
//                   children: [
//                     const Icon(
//                       Icons.person_outline,
//                       size: 12,
//                       color: Colors.grey,
//                     ),
//                     Obx(
//                       () => Text(
//                         '${hisabController.customers.length} Customers',
//                       ),
//                     ),
//                   ],
//                 ),
//                 trailing: Obx(() {
//                   double balance = customerController.netBalance.value;
//                   String netBalance = formatBalance(
//                     double.parse(balance.toStringAsFixed(0)).abs(),
//                   );
//                   String balanceText = balance >= 0 ? "You pay" : "You get";
//                   Color netBalanceColor = balance >= 0
//                       ? Colors.green
//                       : Colors.red;
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: .end,
//                     children: [
//                       Text(
//                         '₹${formatCurrency(netBalance)}',
//                         style: bodyText(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           textColor: netBalanceColor,
//                         ),
//                       ),
//                       Text(
//                         balanceText,
//                         style: bodyText(textColor: Colors.grey, fontSize: 11),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//             Obx(() {
//               int itemCount =
//                   customerController.customers.length; // +1 for the ad
//               if (customerController.customers.isEmpty) {
//                 return const Expanded(
//                   child: Center(
//                     child: Text(
//                       "No customers found",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black54,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 );
//               }
//               return Expanded(
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) => const Divider(
//                     height: 0,
//                     indent: 65,
//                     endIndent: 20,
//                     color: Colors.grey,
//                     thickness: 0.5,
//                   ),
//                   padding: const EdgeInsets.only(bottom: 70),
//                   itemCount: itemCount,
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     // if (index == 2) {
//                     //   // insert ad at position 3
//                     //   if (AdService.isNativeAdLoaded) {
//                     //     return Container(
//                     //         height: 80,
//                     //         padding: const EdgeInsets.symmetric(horizontal: 10),
//                     //         child: AdWidget(ad: AdService.nativeAd!));
//                     //   } else {
//                     //     return const SizedBox(); // Or a loading placeholder
//                     //   }
//                     // }
//                     // int dataIndex = (index > 2) ? index - 1 : index;
//
//                     Customer customer = customerController.customers[index];
//                     Color balanceColor = (customer.balance ?? 0) >= 0
//                         ? Colors.green
//                         : Colors.red;
//                     return Dismissible(
//                       key: Key(customer.id.toString()),
//                       direction: DismissDirection.endToStart,
//                       background: Container(
//                         color: Colors.red,
//                         alignment: Alignment.centerRight,
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                       ),
//                       secondaryBackground: Container(
//                         color: Colors.red,
//                         alignment: Alignment.centerRight,
//                         // Show delete icon on the right when swiped right
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: const Icon(Icons.delete, color: Colors.white),
//                       ),
//                       confirmDismiss: (direction) {
//                         return Get.dialog(
//                           CustomDialogs(
//                             title: "Delete Customer?",
//                             message:
//                                 "Do you want to remove this customer from your records?",
//                             positiveText: 'Delete',
//                             negativeText: 'Cancel',
//                             onPositivePress: () => Get.back(result: true),
//                             onNegativePress: () => Get.back(result: false),
//                           ),
//                         );
//                       },
//                       onDismissed: (direction) {
//                         customerController
//                             .deleteCustomer(customer.id!)
//                             .then(
//                               (value) => billHomeController.getInvoiceList(),
//                             );
//                         // customerController.loadInvoiceCount();
//                         // customerController.customers.removeAt(index);
//                         showSnackBar("${customer.name} has been removed");
//                       },
//                       child: ListTile(
//                         onTap: () =>
//                             // Get.toNamed('/transactions-history',arguments: customer)
//                             Get.to(
//                               () => CustomerReportScreen(customer: customer),
//                             )?.then(
//                               (
//                                 value,
//                               ) => /*FocusManager.instance.primaryFocus?.unfocus()*/
//                                   null,
//                             ),
//                         title: Text(customer.name),
//                         leading: CircleAvatar(
//                           child: Text(
//                             customer.name.substring(0, 1).toUpperCase(),
//                             style: headerText(textColor: colorFontBlack),
//                           ),
//                         ),
//                         subtitle: (customer.createdAt == null)
//                             ? const SizedBox()
//                             : Text(
//                                 "Added on ${DateFormat('dd MMM, yyyy').format(DateTime.parse(customer.createdAt ?? ""))}",
//                               ),
//                         trailing: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Text(
//                               "₹${formatCurrency(customer.balance?.abs().toStringAsFixed(0) ?? "0")}",
//                               style: bodyText(
//                                 textColor: balanceColor,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             Text(
//                               (customer.balance ?? 0) > 0 ? 'Advance' : 'Due',
//                               style: bodyText(
//                                 textColor: Colors.grey,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }