import 'package:flutter/cupertino.dart';

class Globals {
  String? o_name, o_address, o_cmyname, logo, o_email;
  String? c_name, c_address, c_cmyname, subject, c_email;
  String? o_phone, c_phone, issued_date, due_date, o_Gstin, c_Gstin;
  int? invoce_no = 2024001, bill_no = 1, n = 1, Total = 0;

  String? item_name;
  List<Map<String, dynamic>> items = [
    {
      'item name': '',
      'qty': 1,
      'price': 0,
      'discount': 0,
      'total': 0,
      'qtyController': TextEditingController(),
      'priceController': TextEditingController(),
      'totalController': TextEditingController(),
      'itemController': TextEditingController(),
    }
  ];
  // List<TextEditingController> itemController = [
  //   TextEditingController(),
  // ];

  static Globals globals = Globals();
}
