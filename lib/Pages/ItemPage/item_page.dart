import 'package:flutter/material.dart';

import '../../Global/global.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  double totalPrice = 0.0;

  double calculateBill() {
    totalPrice = 0.0;
    Globals.globals.items.forEach((element) {
      totalPrice += (element['price'] * element['qty']);
    });
    return totalPrice;
  }

  @override
  void initState() {
    calculateBill();
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
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text('PDF'),
            ),
          ],
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
                        '           No      Item Name         Qty         Price            Total',
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
                          padding: EdgeInsets.all(10),
                          height: h * 0.2,
                          width: w * 0.2,
                          child: Text('${index + 1}'),
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
                        flex: 4,
                        child: TextFormField(
                          controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['item name'] = val;
                          },
                          // initialValue: Globals.globals.item_name,
                          textInputAction: TextInputAction.next,
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
                        flex: 2,
                        child: TextFormField(
                          // controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['qty'] = val;
                          },
                          // initialValue: Globals.globals.,
                          textInputAction: TextInputAction.next,
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
                        flex: 3,
                        child: TextFormField(
                          // controller: Globals.globals.itemController[index]
                          onChanged: (val) {
                            Globals.globals.items[index]['price'] = val;
                          },
                          // initialValue: Globals.globals.o_name,
                          textInputAction: TextInputAction.next,
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
                        flex: 3,
                        child: TextFormField(
                          // controller: Globals.globals.itemController[index],
                          onChanged: (val) {
                            Globals.globals.items[index]['total'] = totalPrice;
                          },
                          // initialValue: Globals.globals.o_name,
                          textInputAction: TextInputAction.next,
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
                  children: [
                    Text(
                      "Total price: ${totalPrice}",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
