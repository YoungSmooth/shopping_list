import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'models/addItem.dart';
import 'models/itemDesign.dart';
import 'models/item_model.dart';

class ShoppingListHome extends StatefulWidget {
  const ShoppingListHome({Key? key}) : super(key: key);

  get item => null;
  _ShoppingListHomeState createState() => _ShoppingListHomeState();
}

class _ShoppingListHomeState extends State<ShoppingListHome> {
  List<itemModel> singleItem = [];
  double cartTotal = 0;

  // double Total = doubwidget.item.price;

  TextEditingController itemController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Neumorphic(
              child: const SizedBox(
                height: 45,
                width: 200,
                child: Center(
                  child: Text(
                    'Smooth Shopping List',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Neumorphic(
              child: SizedBox(
                height: 30,
                width: 100,
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '\$$total',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return ItemDesign(
              item: singleItem[index],
            );
          }),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 2);
          },
          itemCount: singleItem.length),
      bottomNavigationBar: GestureDetector(
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Input Item Description',
                              border: OutlineInputBorder(),
                            ),
                            controller: itemController,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            // keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input Price',
                              border: OutlineInputBorder(),
                            ),
                            controller: priceController,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            // keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Input Quantity',
                              border: OutlineInputBorder(),
                            ),
                            controller: quantityController,
                          ),
                          GestureDetector(
                              onTap: () {
                                final item = itemModel(
                                  false,
                                  itemController.text,
                                  double.parse(quantityController.text),
                                  double.parse(priceController.text),
                                );
                                setState(() {
                                  singleItem.add(item);
                                  total = total + (item.price * item.quantity);
                                });
                                itemController.clear();
                                quantityController.clear();
                                priceController.clear();

                                Navigator.pop(context);
                              },
                              child: const AddItem(title: 'Save')),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: const AddItem(
            title: 'Add an Item',
          )),
    );
  }

  var getHim = 1;
}
