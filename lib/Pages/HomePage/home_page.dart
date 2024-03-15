import 'package:flutter/material.dart';
import 'package:invoice_generater/utils/routes_utils.dart';

import '../../Global/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Invoice Generater'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Let's Join Bill together"),
                  const Divider(color: Colors.blueGrey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        height: h * 0.67,
                        width: w * 0.46,
                        color: Colors.white30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Owner Data Here...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            SizedBox(height: h * 0.006),
                            Container(
                              height: h * 0.056,
                              width: w * 0.4,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Text(
                                  'Invoice No : ${Globals.globals.invoce_no} \nBill No : ${Globals.globals.bill_no}'),
                            ),
                            SizedBox(height: h * 0.01),
                            //logo
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.logo = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Your Logo here...'
                                  : 'Logo Here',
                              initialValue: Globals.globals.o_name,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.logout),
                                label: const Text('Logo'),
                                hintText:
                                    'UploadFile Here...JPEG, PNG less than 5MB',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Owner name
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.o_name = val;
                              },
                              validator: (val) =>
                                  val!.isEmpty ? 'Must Enter Owner Name' : null,
                              initialValue: Globals.globals.o_name,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person_outline),
                                label: const Text('Owner Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Company name
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.o_cmyname = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your company Name'
                                  : null,
                              initialValue: Globals.globals.o_cmyname,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.domain_add_sharp),
                                label: const Text('Company Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Address
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.c_address = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your Address'
                                  : null,
                              initialValue: Globals.globals.c_address,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.location_on_outlined),
                                label: const Text('From Address'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Contact
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.o_phone = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your Contact'
                                  : val.length < 10
                                      ? 'Contact Must be Enter 10 Digits'
                                      : null,
                              initialValue: Globals.globals.o_phone,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: '+91 9825364582',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: const Text('Contact'),
                                prefixIcon:
                                    const Icon(Icons.phone_android_rounded),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: h * 0.67,
                        width: w * 0.455,
                        color: Colors.white30,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Customer Data Here...',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey),
                            ),
                            SizedBox(height: h * 0.006),
                            //Invoice date
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.issued_date = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Issued Date'
                                  : null,
                              initialValue: Globals.globals.issued_date,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range_outlined),
                                label: const Text('Issued Date'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //due date
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.due_date = val;
                              },
                              validator: (val) =>
                                  val!.isEmpty ? 'Must Enter Due Date' : null,
                              initialValue: Globals.globals.due_date,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range_outlined),
                                label: const Text('Due Date'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            // subject
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.subject = val;
                              },
                              validator: (val) =>
                                  val!.isEmpty ? 'Must Enter Subject' : null,
                              initialValue: Globals.globals.subject,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.location_on_outlined),
                                label: const Text('Subject'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Customer name
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.c_name = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Customer Name'
                                  : null,
                              initialValue: Globals.globals.c_address,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_outline),
                                label: const Text('Customer Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Company name
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.c_cmyname = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your company Name'
                                  : null,
                              initialValue: Globals.globals.c_address,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.domain_add_sharp),
                                label: const Text('Company Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Customer Address
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.o_address = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your Address'
                                  : null,
                              initialValue: Globals.globals.c_address,
                              decoration: InputDecoration(
                                prefixIcon:
                                    const Icon(Icons.location_on_outlined),
                                label: const Text('To Address'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: h * 0.01),
                            //Contact
                            TextFormField(
                              onSaved: (val) {
                                Globals.globals.c_phone = val;
                              },
                              validator: (val) => val!.isEmpty
                                  ? 'Must Enter Your Contact'
                                  : val.length < 10
                                      ? 'Contact Must be Enter 10 Digits'
                                      : null,
                              initialValue: Globals.globals.o_phone,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: '+91 9825364582',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                label: const Text('Contact'),
                                prefixIcon:
                                    const Icon(Icons.phone_android_rounded),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        onPressed: () {
                          bool validated = formKey.currentState!.validate();
                          if (validated) {
                            formKey.currentState!.save();
                          }
                        },
                        icon: Icon(Icons.save),
                        label: Text('Save'),
                      ),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.of(context).pushNamed(MyRotes.itemPage);
                        },
                        icon: Icon(Icons.save),
                        label: Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
