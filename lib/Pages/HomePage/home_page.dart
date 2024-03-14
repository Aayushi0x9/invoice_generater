import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Generater'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Let's Join Bill together"),
            const Divider(
              color: Colors.blueGrey,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: const Text('Logo'),
                hintText: '''UploadFile Here...JPEG, PNG less than 5MB''',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.005,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Invoice Number'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
