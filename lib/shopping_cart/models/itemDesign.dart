import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'item_model.dart';

class ItemDesign extends StatefulWidget {
  final itemModel item;
  const ItemDesign({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemDesign> createState() => _ItemDesignState();
}

double total = 0;

class _ItemDesignState extends State<ItemDesign> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 30,
          top: 8,
          bottom: 8,
          right: 8,
        ),
        child: Neumorphic(
          style:
              NeumorphicStyle(color: Colors.grey, border: NeumorphicBorder()),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              // borderRadius: BorderRadius.circular(20),
              // border: Border.all(
              //   width: 1,
              //   // color: Colors.grey.shade300,
              // ),
            ),
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: Row(children: [
              const SizedBox(
                width: 60,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 45,
                        width: 180,
                        child: Text(
                          widget.item.name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.item.quantity =
                                      widget.item.quantity - 1;
                                  total = total +
                                      (widget.item.price *
                                          widget.item.quantity);
                                });
                              },
                              child: SizedBox(
                                width: 20,
                                child: NeumorphicIcon(Icons.remove),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                // width: 40,
                                height: 25,
                                child: FittedBox(
                                  child: Text(
                                    '${widget.item.quantity}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        backgroundColor: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.item.quantity =
                                          widget.item.quantity + 1;
                                      total = total +
                                          (widget.item.price *
                                              widget.item.quantity);
                                    });
                                  },
                                  child: NeumorphicIcon(Icons.add)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 50,
                        child: FittedBox(
                          child: Text(
                            '\$${widget.item.price * widget.item.quantity}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child:
                            Checkbox(value: widget.item.check, onChanged: null),
                      ),
                    ],
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
      Positioned(
        left: 5,
        top: 5,
        child: SizedBox(
          height: 110,
          width: 90,
          child: Image.network(
            'https://freepngimg.com/download/strawberry/1-strawberry-png-images.png',
          ),
        ),
      )
    ]);
  }
}
