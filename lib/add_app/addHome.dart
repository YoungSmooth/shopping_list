import 'package:flutter/material.dart';

class AddHome extends StatefulWidget {
  const AddHome({Key? key}) : super(key: key);
  _WidgetState createState() => _WidgetState();
}

class _WidgetState extends State<AddHome> {
  int balance = 0;
  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Add money to my account.'),
            Text(
              '$balance',
              style: TextStyle(
                fontSize: 30,
                color: balance > 0 ? Colors.green : Colors.red,
              ),
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
              onPressed: () {
                setState(() {
                  balance = balance + 1000;
                });
              },
              child: const Text(
                'Add Money',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                setState(() {
                  balance = balance - 1000;
                });
              },
              child: const Text(
                'Remove Money',
              ),
            ),
            // Container(height: {sm: 1, md: 20, lg: 100}.vs,),
          ],
        ),
      ),
    );
  }
}
