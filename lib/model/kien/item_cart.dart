import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/data/kien/cart_Reader.dart';

class Item_cart extends StatefulWidget {
  final Carts carts;
  const Item_cart(
      {super.key,
      required this.ischeck,
      required this.onCheckboxChanged,
      required this.carts,
      required this.onQuantityChanged});
  final bool ischeck;
  final Function(bool) onCheckboxChanged;
  final VoidCallback onQuantityChanged;
  @override
  State<Item_cart> createState() => _Item_cartState();
}

class _Item_cartState extends State<Item_cart> {
  List<Carts> selectedItems = [];
  bool _ischeck = false;
  Color myLightGrayColor = const Color.fromARGB(243, 243, 227, 227);
  Future<void> _showConfirm() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 239, 232, 232),
          title: const Text('Bạn có muốn xóa?', textAlign: TextAlign.center),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                  },
                  child:
                      const Text('Hủy', style: TextStyle(color: Colors.black)),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink.shade100),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (widget.carts.id.isNotEmpty) {
                      await Carts.deleteCartByAutoid(
                          widget.carts.id.toString());
                      Navigator.of(context).pop(); // Đóng dialog
                    } else {
                      print('Invalid autoid: ${widget.carts.id}');
                    }
                  },
                  child:
                      const Text('Xóa', style: TextStyle(color: Colors.black)),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _ischeck = widget.ischeck;
  }

  @override
  void didUpdateWidget(covariant Item_cart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _ischeck = widget.ischeck;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.black,
            fillColor: MaterialStateProperty.all(Colors.pink.shade100),
            side: const BorderSide(color: Colors.black),
            value: _ischeck,
            onChanged: (bool? value) {
              setState(() {
                _ischeck = value ?? false;
                if (_ischeck) {
                  selectedItems.add(widget.carts);
                } else {
                  selectedItems.remove(widget.carts);
                }
              });
              widget.onCheckboxChanged(_ischeck);

              // Check if the checkbox is unchecked and remove from selectedItems
              if (!_ischeck) {
                selectedItems.remove(widget.carts);
              }

              widget.onCheckboxChanged(_ischeck);
            },
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: myLightGrayColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children:  [
                 Image.network(
                   widget.carts.image,
                   width: MediaQuery.of(context).size.width / 4,
                   height: MediaQuery.of(context).size.height / 6,
                   fit: BoxFit.contain,
                 ),
                const SizedBox(
                  width: 10,
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width:MediaQuery.of(context).size.width /2,
                      child: Text(widget.carts.name,
                        style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)
                          ),),
                   const  SizedBox(
                      height: 10,
                    ),

                     Text(widget.carts.price,
                       style: const TextStyle(
                         fontSize: 18,
                         )),
                     const SizedBox(
                       height: 10,
                     ),
                     Text("Size:${widget.carts.size}",
                        style: const TextStyle(fontSize: 18)),
                     const SizedBox(
                       height: 10,
                     ),
                     Container(
                      child: Row(
                        children: [
                         TextButton(
                              onPressed: () async {
                                setState(() {
                                  if (int.parse(widget.carts.quality) > 0) {
                                    widget.carts.quality =
                                        (int.parse(widget.carts.quality) - 1)
                                            .toString();
                                  }
                                });
                                await FirebaseFirestore.instance
                                    .collection('carts')
                                    .doc(widget.carts.id.toString())
                                    .update({
                                  'quality': widget.carts.quality,
                                });
                                widget.onCheckboxChanged(_ischeck);
                                widget.onQuantityChanged();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                minimumSize:
                                    MaterialStateProperty.all(const Size(1, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Icon(Icons.remove),
                            ),

                             Container(
                              margin: const EdgeInsets.all(10),
                      child: Text(widget.carts.quality.toString(),
                       style: const TextStyle(fontSize: 20.0)),
                   
                      ),
                      TextButton(
                              onPressed: () async {
                                setState(() {
                                  if (int.parse(widget.carts.quality) >= 0) {
                                    widget.carts.quality =
                                        (int.parse(widget.carts.quality) + 1)
                                            .toString();
                                  }
                                });
                    
                                await FirebaseFirestore.instance
                                    .collection('carts')
                                    .doc(widget.carts.id.toString())
                                    .update({
                                  'quality': widget.carts.quality,
                                });
                                widget.onCheckboxChanged(_ischeck);
                                widget.onQuantityChanged(); //thay đổi số lượng
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black),
                                minimumSize:
                                    MaterialStateProperty.all(const Size(1, 1)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              child: const Icon(Icons.add),
                            ),
                            IconButton(
                              onPressed: () {
                                _showConfirm();
                              },
                              icon: const Icon(Icons.delete),
                            ),
                        ],
                      ),
                     ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
