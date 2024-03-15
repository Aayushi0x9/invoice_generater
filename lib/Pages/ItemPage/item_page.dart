import 'package:flutter/material.dart';

import '../../Global/global.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
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
          title: const Text('Add Items'),
          titleSpacing: 1,
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey.shade50,
        body: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: h * 0.05,
                      margin: const EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blueGrey,
                          width: 1,
                        ),
                      ),
                      child: const Text(
                        '           No     Item Name      Qty      Price     Discount     Total',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                Globals.globals.items.length,
                (index) => SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    height: h * 0.07,
                    width: w,
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Globals.globals.itemController
                                .remove(TextEditingController());
                            Globals.globals.items.remove('');
                            setState(() {});
                          },
                          icon: const Icon(Icons.delete_outline),
                        ),

                        //no.
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: h * 0.2,
                            width: w * 0.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        //item name
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: Globals.globals.itemController[index],
                            onSaved: (val) {
                              Globals.globals.item_name = val;
                            },
                            initialValue: Globals.globals.o_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        //quantity
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: Globals.globals.itemController[index],
                            onSaved: (val) {
                              // Globals.globals.= val;
                            },
                            initialValue: Globals.globals.o_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        //price
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: Globals.globals.itemController[index],
                            onSaved: (val) {
                              Globals.globals.o_name = val;
                            },
                            initialValue: Globals.globals.o_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        //discount
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: Globals.globals.itemController[index],
                            onSaved: (val) {
                              Globals.globals.o_name = val;
                            },
                            initialValue: Globals.globals.o_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: w * 0.01,
                        ),
                        //ammount
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: Globals.globals.itemController[index],
                            onSaved: (val) {
                              Globals.globals.o_name = val;
                            },
                            initialValue: Globals.globals.o_name,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Globals.globals.itemController
                          .add(TextEditingController());
                      Globals.globals.items.add('');
                      setState(() {});
                    },
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
