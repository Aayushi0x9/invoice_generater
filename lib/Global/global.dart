import 'package:flutter/cupertino.dart';

class Globals {
  String? o_name, o_address, o_cmyname, logo;
  String? c_name, c_address, c_cmyname, subject;
  String? o_phone, c_phone, issued_date, due_date;
  int? invoce_no = 2024001, bill_no = 1, n = 1;

  String? item_name;
  List<dynamic> items = ["", ""];
  List<TextEditingController> itemController = [
    TextEditingController(),
    TextEditingController(),
  ];
  List<int> Quantity = [];
  List<int> discount = [];
  List<int> total = [];

  static Globals globals = Globals();
}
