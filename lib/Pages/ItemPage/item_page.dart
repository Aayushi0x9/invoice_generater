import 'package:flutter/material.dart';

import '../../Global/global.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int Total = 0;

  @override
  void initState() {
    Globals.globals.items
        .map((e) => {Globals.globals.Total += Globals.globals.items})
        .toList();
    super.initState();
  }

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
                (index) => Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  height: h * 0.07,
                  width: w,
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Globals.globals.items.removeAt(index);
                          Globals.globals.itemController.removeAt(index);
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
                          onChanged: (val) {
                            Globals.globals.items[index]['item name'] = val;
                          },
                          // initialValue: Globals.globals.item_name,
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
                          // controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['qty'] = val;
                          },
                          // initialValue: Globals.globals.,
                          keyboardType: TextInputType.number,
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
                          // controller: Globals.globals.itemController[index]
                          onChanged: (val) {
                            Globals.globals.items[index]['price'] = val;
                          },
                          // initialValue: Globals.globals.o_name,
                          keyboardType: TextInputType.number,
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
                          // controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['discount'] = val;
                          },
                          // initialValue: Globals.globals.o_name,
                          keyboardType: TextInputType.number,
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
                          // controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['total'] = val;
                          },
                          // initialValue: Globals.globals.o_name,
                          keyboardType: TextInputType.number,
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
                      Globals.globals.items.add({
                        'item name': '',
                        'qty': '',
                        'price': '',
                        'discount': '',
                        'total': '',
                      });
                      setState(() {});
                    },
                    child: const Text('Add Item'),
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: h * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(-2, -2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [Text('Total : ')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
